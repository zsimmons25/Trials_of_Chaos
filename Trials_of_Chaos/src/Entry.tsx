import React from 'react';
import { useForm } from '@tanstack/react-form';
import {
  useSuspenseQuery,
  useMutation,
  useQueryClient,
} from '@tanstack/react-query';
import { useRanger } from '@tanstack/react-ranger';
import { itemqfn, ItemsResponse, createItem } from './handlers/itemsquery';
import { affixqfn } from './handlers/affixesquery';
import { Affix } from './types/affixes';

// Interfaces
export interface ItemFormData {
  item_name: string;
  item_class: string;
  base_type: string;
  ilvl: number;
  enchant?: string | null;
  sockets?: number | null;
  implicit?: number | null;
  prefix1?: string | null;
  p1v1?: number | null;
  p1v2?: number | null;
  prefix2?: string | null;
  p2v1?: number | null;
  p2v2?: number | null;
  prefix3?: string | null;
  p3v1?: number | null;
  p3v2?: number | null;
  suffix1?: string | null;
  s1v?: number | null;
  suffix2?: string | null;
  s2v?: number | null;
  suffix3?: string | null;
  s3v?: number | null;
  corrupted: boolean;
  mirrored: boolean;
}

interface FormField {
  state: { value: number | undefined };
  handleChange: (value: number) => void;
}

// Constants
const ITEM_CLASSES = [
  'Crossbow',
  'Quarterstaff',
  'Staff',
  'Two Hand Sword',
  'Two Hand Axe',
  'Two Hand Mace',
  'One Hand Sword',
  'One Hand Axe',
  'One Hand Mace',
  'Claw',
  'Dagger',
  'Flail',
  'Spear',
  'Wand',
  'Focus',
  'Shield',
  'Bow',
  'Quiver',
  'Helmet',
  'Body Armour',
  'Gloves',
  'Boots',
  'Belt',
  'Ring',
  'Amulet',
];

const TWO_HANDED_CLASSES = new Set([
  'Crossbow',
  'Quarterstaff',
  'Staff',
  'Two Hand Sword',
  'Two Hand Axe',
  'Two Hand Mace',
]);

// Regex Patterns
// Matches a range like (1-10)
const RANGE_PATTERN = /\((\d+)[–\-−](\d+)\)/;
// Matches multiple ranges like (1-10)
const RANGE_PATTERN_GLOBAL = /\((\d+)[–\-−](\d+)\)/g;
// Matches multiple ranges like +(1-10)
const PLUS_RANGE_PATTERN_GLOBAL = /\+\((\d+)[–\-−](\d+)\)/g;
// Matches "Adds (X-Y) to (A-B)"
const ADDS_TO_PATTERN = /Adds \((\d+)[–\-−](\d+)\) to \((\d+)[–\-−](\d+)\)/;
// Matches "X to (A-B)"
const X_TO_RANGE_PATTERN = /(\d+) to \((\d+)[–\-−](\d+)\)/;
// Matches a single number
const SINGLE_NUMBER_PATTERN = /(\d+)/;

// Helper functions
const sanitizeFormData = (data: any): ItemFormData => ({
  item_name: data.item_name || '',
  item_class: data.item_class || '',
  base_type: data.base_type || '',
  ilvl: Number(data.ilvl) || 80,
  enchant: data.enchant || null,
  sockets: data.sockets ? Number(data.sockets) : null,
  implicit: Number(data.implicit) || 0,
  prefix1: data.prefix1 || null,
  p1v1: typeof data.p1v1 === 'number' ? data.p1v1 : null,
  p1v2: typeof data.p1v2 === 'number' ? data.p1v2 : null,
  prefix2: data.prefix2 || null,
  p2v1: typeof data.p2v1 === 'number' ? data.p2v1 : null,
  p2v2: typeof data.p2v2 === 'number' ? data.p2v2 : null,
  prefix3: data.prefix3 || null,
  p3v1: typeof data.p3v1 === 'number' ? data.p3v1 : null,
  p3v2: typeof data.p3v2 === 'number' ? data.p3v2 : null,
  suffix1: data.suffix1 || null,
  s1v: typeof data.s1v === 'number' ? data.s1v : null,
  suffix2: data.suffix2 || null,
  s2v: typeof data.s2v === 'number' ? data.s2v : null,
  suffix3: data.suffix3 || null,
  s3v: typeof data.s3v === 'number' ? data.s3v : null,
  corrupted: Boolean(data.corrupted),
  mirrored: Boolean(data.mirrored),
});

const extractMultipleRangesFromEffect = (effect: string) => {
  const cleanEffect = effect.replace(/\n/g, ' ').trim();

  // Matches "Adds (X-Y) to (A-B)"
  const addsToMatch = cleanEffect.match(ADDS_TO_PATTERN);
  if (addsToMatch) {
    return {
      range1: { min: parseInt(addsToMatch[1]), max: parseInt(addsToMatch[2]) },
      range2: { min: parseInt(addsToMatch[3]), max: parseInt(addsToMatch[4]) },
    };
  }

  // Matches "X to (A-B)"
  const xToRangeMatch = cleanEffect.match(X_TO_RANGE_PATTERN);
  if (xToRangeMatch) {
    return {
      range1: {
        min: parseInt(xToRangeMatch[1]),
        max: parseInt(xToRangeMatch[1]),
      },
      range2: {
        min: parseInt(xToRangeMatch[2]),
        max: parseInt(xToRangeMatch[3]),
      },
    };
  }

  // Find all parenthetical ranges
  const ranges: { min: number; max: number }[] = [];
  const foundPatterns = new Set<string>();
  const patterns = [RANGE_PATTERN_GLOBAL, PLUS_RANGE_PATTERN_GLOBAL];

  for (const pattern of patterns) {
    let match;
    pattern.lastIndex = 0;
    while ((match = pattern.exec(cleanEffect)) !== null) {
      const min = parseInt(match[1]);
      const max = parseInt(match[2]);
      const patternKey = `${min}-${max}`;
      if (!foundPatterns.has(patternKey)) {
        ranges.push({ min, max });
        foundPatterns.add(patternKey);
      }
    }
  }

  return { range1: ranges[0] || null, range2: ranges[1] || null };
};

const extractImplicitRange = (implicitText: string) => {
  if (!implicitText) return null;

  // Look for parenthetical ranges like (20–30)
  const rangeMatch = implicitText.match(RANGE_PATTERN);
  if (rangeMatch) {
    return {
      min: parseInt(rangeMatch[1]),
      max: parseInt(rangeMatch[2]),
    };
  }

  // Look for single numbers
  const singleMatch = implicitText.match(SINGLE_NUMBER_PATTERN);
  if (singleMatch) {
    const value = parseInt(singleMatch[1]);
    return {
      min: value,
      max: value,
    };
  }

  return null;
};

// Range Slider Component
const RangeSlider = ({
  values,
  onChange,
  min,
  max,
  step = 1,
  disabled = false,
}: {
  values: number[];
  onChange: (values: number[]) => void;
  min: number;
  max: number;
  step?: number;
  disabled?: boolean;
}) => {
  const trackElRef = React.useRef<HTMLDivElement>(null);
  const rangerInstance = useRanger({
    values,
    onChange: (instance) => onChange([...instance.sortedValues]),
    min,
    max,
    stepSize: step,
    getRangerElement: () => trackElRef.current,
  });

  if (disabled || min === max) {
    return (
      <div className='space-y-2'>
        <div className='text-sm text-gray-400'>Fixed value: {min}</div>
        <div className='flex h-8 items-center'>
          <div className='relative h-3 w-full rounded-full bg-gray-700'>
            <div className='absolute inset-0 rounded-full bg-blue-600'></div>
            <div className='absolute left-1/2 top-1/2 h-6 w-6 -translate-x-1/2 -translate-y-1/2 transform rounded-full border-2 border-white bg-blue-500 shadow-lg'></div>
          </div>
        </div>
      </div>
    );
  }

  const currentValue = values[0];
  const percentage = rangerInstance.getPercentageForValue(currentValue);

  return (
    <div className='space-y-3'>
      <div className='flex items-center justify-between'>
        <div className='text-sm font-medium text-gray-300'>
          Value: {currentValue}
        </div>
        <div className='text-xs text-gray-500'>
          Range: {min}–{max}
        </div>
      </div>
      <div className='flex h-8 items-center'>
        <div
          ref={trackElRef}
          className='relative h-3 w-full cursor-pointer rounded-full bg-gray-700 transition-colors duration-150 hover:bg-gray-600'
        >
          <div
            className='absolute inset-y-0 left-0 rounded-full bg-blue-600 transition-all duration-150 ease-out'
            style={{ width: `${percentage}%` }}
          />
          {rangerInstance.handles().map((handle, index) => (
            <div
              key={index}
              onKeyDown={handle.onKeyDownHandler}
              onMouseDown={handle.onMouseDownHandler}
              onTouchStart={handle.onTouchStart}
              role='slider'
              tabIndex={0}
              aria-valuemin={min}
              aria-valuemax={max}
              aria-valuenow={currentValue}
              style={{ left: `${percentage}%` }}
              className='absolute top-1/2 h-6 w-6 -translate-x-1/2 -translate-y-1/2 transform cursor-grab rounded-full border-2 border-white bg-blue-500 shadow-lg transition-all duration-150 ease-out hover:scale-105 hover:bg-blue-400 focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-opacity-50 active:cursor-grabbing'
            >
              <div className='absolute inset-1 rounded-full bg-white opacity-30'></div>
            </div>
          ))}
        </div>
      </div>
      {max - min <= 35 && (
        <div className='flex justify-between px-1 text-xs text-gray-600'>
          {Array.from({ length: Math.min(max - min + 1, 11) }, (_, i) => {
            const value =
              min + Math.floor((i * (max - min)) / Math.min(max - min, 10));
            return (
              <span
                key={value}
                className={`transition-colors duration-150 ${value === currentValue ? 'font-medium text-blue-400' : ''}`}
              >
                {value}
              </span>
            );
          })}
        </div>
      )}
    </div>
  );
};

// Value Field Components
const createValueField = (affixType: 'prefix' | 'suffix') =>
  React.memo(
    ({
      num,
      valueNum,
      form,
      look,
      extractMultipleRangesFromEffect,
    }: {
      num: number;
      valueNum?: 1 | 2;
      form: any;
      look: any;
      extractMultipleRangesFromEffect: any;
    }) => {
      const [selectedAffix, setSelectedAffix] = React.useState<string>('');
      const [selectedItemClass, setSelectedItemClass] =
        React.useState<string>('');

      React.useEffect(() => {
        const unsubscribe = form.store.subscribe(() => {
          const state = form.store.state;
          const affixName =
            (state.values[
              `${affixType}${num}` as keyof ItemFormData
            ] as string) || '';
          const itemClass = (state.values.item_class as string) || '';
          setSelectedAffix(affixName);
          setSelectedItemClass(itemClass);
        });

        const state = form.store.state;
        setSelectedAffix(
          (state.values[
            `${affixType}${num}` as keyof ItemFormData
          ] as string) || ''
        );
        setSelectedItemClass((state.values.item_class as string) || '');

        return unsubscribe;
      }, [num, form.store]);

      const affix = React.useMemo(() => {
        return selectedAffix ? look(selectedAffix, selectedItemClass) : null;
      }, [selectedAffix, selectedItemClass, look]);

      const ranges = React.useMemo(() => {
        return affix
          ? extractMultipleRangesFromEffect(affix.effect)
          : { range1: null, range2: null };
      }, [affix, extractMultipleRangesFromEffect]);

      if (!selectedAffix) {
        return (
          <div>
            <label className='mb-2 block text-sm font-medium'>
              {affixType === 'prefix' ? `Value ${valueNum}` : 'Value'}
            </label>
            <div className='text-sm text-gray-500'>
              Select a {affixType} to set{' '}
              {affixType === 'prefix' ? 'values' : 'value'}
            </div>
          </div>
        );
      }

      if (!affix) {
        return (
          <div>
            <label className='mb-2 block text-sm font-medium'>
              {affixType === 'prefix' ? `Value ${valueNum}` : 'Value'}
            </label>
            <div className='text-sm text-gray-500'>Affix not found</div>
          </div>
        );
      }

      const range =
        affixType === 'prefix'
          ? valueNum === 1
            ? ranges.range1
            : ranges.range2
          : ranges.range1;

      if (!range) {
        return (
          <div>
            <label className='mb-2 block text-sm font-medium'>
              {affixType === 'prefix' ? `Value ${valueNum}` : 'Value'}
            </label>
            <div className='text-sm text-gray-500'>
              {affixType === 'prefix' && valueNum === 2
                ? 'No second value for this affix'
                : 'No valid range found'}
            </div>
          </div>
        );
      }

      const fieldName =
        affixType === 'prefix' ? `p${num}v${valueNum}` : `s${num}v`;

      return (
        <form.Field
          name={fieldName as keyof ItemFormData}
          children={(field: FormField) => {
            const currentValue = (field.state.value as number) || range.min;
            return (
              <div>
                <label className='mb-2 block text-sm font-medium'>
                  {affixType === 'prefix' ? `Value ${valueNum}` : 'Value'}
                </label>
                <RangeSlider
                  values={[currentValue]}
                  onChange={(values) => field.handleChange(values[0])}
                  min={range.min}
                  max={range.max}
                  disabled={range.min === range.max}
                />
                <div className='mt-1 text-xs text-gray-400'>
                  Form value: {field.state.value ?? 'undefined'}
                </div>
              </div>
            );
          }}
        />
      );
    }
  );

const PrefixValueField = createValueField('prefix');
const SuffixValueField = createValueField('suffix');

// Main Entry component
function Entry() {
  // Data queries
  const queryClient = useQueryClient();
  const { data: itemAndBaseData } = useSuspenseQuery<ItemsResponse>({
    queryKey: ['items'],
    queryFn: itemqfn,
    refetchOnWindowFocus: false,
  });
  const { data: affixes } = useSuspenseQuery<Affix[]>({
    queryKey: ['affixes'],
    queryFn: affixqfn,
    refetchOnWindowFocus: false,
  });
  const { bases } = itemAndBaseData;

  // State
  const [currentItemClass, setCurrentItemClass] = React.useState('');
  const [currentBaseType, setCurrentBaseType] = React.useState('');
  const [selectedPrefixFamilies, setSelectedPrefixFamilies] = React.useState<
    Set<string>
  >(new Set());
  const [selectedSuffixFamilies, setSelectedSuffixFamilies] = React.useState<
    Set<string>
  >(new Set());

  // Helper functions
  const look = (
    affixNameToFind?: string,
    itemClass?: string
  ): Affix | undefined => {
    if (!affixNameToFind || !affixes) return undefined;
    const candidates = affixes.filter((a) => a.affix_name === affixNameToFind);
    if (candidates.length === 0) return undefined;
    if (candidates.length === 1) return candidates[0];

    if (itemClass) {
      const isItemTwoHanded = TWO_HANDED_CLASSES.has(itemClass);
      const match = candidates.find((c) =>
        isItemTwoHanded
          ? c.item_tags.includes('two_hand_weapon')
          : c.item_tags.includes('one_hand_weapon')
      );
      if (match) return match;
    }
    return candidates[0];
  };

  const isAffixCompatibleWithItemClass = (
    affix: Affix,
    selectedBaseType: string
  ): boolean => {
    if (!selectedBaseType) return false;

    // Find the base item by name
    const baseItem = bases.find((base) => base.base_name === selectedBaseType);
    if (!baseItem) return false;

    const baseItemTags = baseItem.item_tags.toLowerCase();
    const affixTags = affix.item_tags.toLowerCase();

    // Split the tags by comma and trim whitespace
    const baseTagsArray = baseItemTags.split(',').map((tag) => tag.trim());
    const affixTagsArray = affixTags.split(',').map((tag) => tag.trim());

    // Check if any of the affix tags match any of the base item tags
    return affixTagsArray.some((affixTag) =>
      baseTagsArray.some(
        (baseTag) => baseTag.includes(affixTag) || affixTag.includes(baseTag)
      )
    );
  };

  const getFilteredAffixes = React.useCallback(
    (
      affixType: 'prefix' | 'suffix',
      baseType: string,
      selectedFamilies: Set<string>,
      currentAffixSlot?: number
    ) => {
      if (!baseType || !affixes) return [];
      const currentSelectedAffix = currentAffixSlot
        ? (form.store.state.values[
            `${affixType}${currentAffixSlot}` as keyof ItemFormData
          ] as string)
        : undefined;

      return affixes
        .filter((affix) => affix.affix_type === affixType)
        .filter((affix) => isAffixCompatibleWithItemClass(affix, baseType))
        .filter((affix) => {
          if (currentSelectedAffix && affix.affix_name === currentSelectedAffix)
            return true;
          return !selectedFamilies.has(affix.family);
        });
    },
    [affixes, isAffixCompatibleWithItemClass]
  );

  const getFilteredPrefixAffixesForSlot = React.useCallback(
    (slotNum: number) =>
      getFilteredAffixes(
        'prefix',
        currentBaseType,
        selectedPrefixFamilies,
        slotNum
      ),
    [getFilteredAffixes, currentBaseType, selectedPrefixFamilies]
  );

  const getFilteredSuffixAffixesForSlot = React.useCallback(
    (slotNum: number) =>
      getFilteredAffixes(
        'suffix',
        currentBaseType,
        selectedSuffixFamilies,
        slotNum
      ),
    [getFilteredAffixes, currentBaseType, selectedSuffixFamilies]
  );

  const getFilteredBases = React.useCallback(() => {
    if (!currentItemClass) return [];
    return bases.filter((base) => base.item_class === currentItemClass);
  }, [bases, currentItemClass]);

  const clearAllAffixes = () => {
    const affixFields = [
      'prefix1',
      'p1v1',
      'p1v2',
      'prefix2',
      'p2v1',
      'p2v2',
      'prefix3',
      'p3v1',
      'p3v2',
      'suffix1',
      's1v',
      'suffix2',
      's2v',
      'suffix3',
      's3v',
    ];
    affixFields.forEach((field) =>
      form.setFieldValue(
        field as keyof ItemFormData,
        field.includes('v') ? undefined : ''
      )
    );
  };

  // Computed values
  const currentBaseItem = React.useMemo(() => {
    if (!currentBaseType) return null;
    return bases.find((base) => base.base_name === currentBaseType) || null;
  }, [bases, currentBaseType]);

  const implicitRange = React.useMemo(() => {
    if (!currentBaseItem?.implicit) return null;
    return extractImplicitRange(currentBaseItem.implicit);
  }, [currentBaseItem]);

  // Mutations
  const createItemMutation = useMutation({
    mutationFn: createItem,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['items'] });
      alert('Item created successfully!');
      form.reset();
    },
    onError: (error) => alert(`Error creating item: ${error.message}`),
  });

  // Form setup
  const form = useForm({
    defaultValues: {
      item_name: '',
      item_class: '',
      base_type: '',
      ilvl: 80,
      enchant: '',
      sockets: 0,
      implicit: 0,
      prefix1: '',
      p1v1: undefined,
      p1v2: undefined,
      prefix2: '',
      p2v1: undefined,
      p2v2: undefined,
      prefix3: '',
      p3v1: undefined,
      p3v2: undefined,
      suffix1: '',
      s1v: undefined,
      suffix2: '',
      s2v: undefined,
      suffix3: '',
      s3v: undefined,
      corrupted: true,
      mirrored: false,
    },
    onSubmit: async ({ value }) => {
      // Validate affix values before sanitizing
      const validationErrors: string[] = [];

      // Check prefixes
      for (let i = 1; i <= 3; i++) {
        const prefixName = value[`prefix${i}` as keyof ItemFormData] as string;
        if (prefixName) {
          const affix = look(prefixName, value.item_class);
          if (affix) {
            const ranges = extractMultipleRangesFromEffect(affix.effect);

            // Check first value
            const v1 = value[`p${i}v1` as keyof ItemFormData] as
              | number
              | undefined;
            if (ranges.range1 && (v1 === undefined || v1 === null)) {
              validationErrors.push(`Prefix ${i} requires a first value`);
            }

            // Check second value if range exists
            const v2 = value[`p${i}v2` as keyof ItemFormData] as
              | number
              | undefined;
            if (ranges.range2 && (v2 === undefined || v2 === null)) {
              validationErrors.push(`Prefix ${i} requires a second value`);
            }
          }
        }
      }

      // Check suffixes
      for (let i = 1; i <= 3; i++) {
        const suffixName = value[`suffix${i}` as keyof ItemFormData] as string;
        if (suffixName) {
          const affix = look(suffixName, value.item_class);
          if (affix) {
            const ranges = extractMultipleRangesFromEffect(affix.effect);

            // Check value
            const v = value[`s${i}v` as keyof ItemFormData] as
              | number
              | undefined;
            if (ranges.range1 && (v === undefined || v === null)) {
              validationErrors.push(`Suffix ${i} requires a value`);
            }
          }
        }
      }

      // Show validation errors if any
      if (validationErrors.length > 0) {
        alert(
          `Please fix the following issues:\n\n${validationErrors.join('\n')}`
        );
        return;
      }

      const sanitizedData = sanitizeFormData(value);
      if (
        !sanitizedData.item_name.trim() ||
        !sanitizedData.item_class.trim() ||
        !sanitizedData.base_type.trim()
      ) {
        alert('Item name, class, and base type are required');
        return;
      }
      createItemMutation.mutate(sanitizedData);
    },
  });

  // Handle implicit value updates when base item changes
  React.useEffect(() => {
    if (currentBaseItem) {
      if (implicitRange) {
        if (implicitRange.min === implicitRange.max) {
          form.setFieldValue('implicit', implicitRange.min);
        } else {
          const currentFormImplicit = form.getFieldValue('implicit');
          if (
            typeof currentFormImplicit !== 'number' ||
            currentFormImplicit === 0
          ) {
            form.setFieldValue('implicit', implicitRange.min);
          }
        }
      } else {
        form.setFieldValue('implicit', 0);
      }
    } else {
      form.setFieldValue('implicit', 0);
    }
  }, [currentBaseItem, implicitRange, form]);

  // Track form state changes for affix families and selected values
  React.useEffect(() => {
    const unsubscribe = form.store.subscribe(() => {
      const state = form.store.state;
      const itemClass = (state.values.item_class as string) || '';
      const baseType = (state.values.base_type as string) || '';
      setCurrentItemClass(itemClass);
      setCurrentBaseType(baseType);

      const updateFamilies = (
        type: 'prefix' | 'suffix',
        setter: React.Dispatch<React.SetStateAction<Set<string>>>
      ) => {
        const families = new Set<string>();
        for (let i = 1; i <= 3; i++) {
          const selectedAffixName = state.values[
            `${type}${i}` as keyof ItemFormData
          ] as string;
          if (selectedAffixName) {
            const selectedAffix = look(selectedAffixName, itemClass);
            if (selectedAffix) families.add(selectedAffix.family);
          }
        }
        setter(families);
      };

      updateFamilies('prefix', setSelectedPrefixFamilies);
      updateFamilies('suffix', setSelectedSuffixFamilies);
    });

    const state = form.store.state;
    setCurrentItemClass((state.values.item_class as string) || '');
    setCurrentBaseType((state.values.base_type as string) || '');
    return unsubscribe;
  }, [form.store, affixes, look]);

  return (
    <div className='mx-auto max-w-4xl bg-zinc-800 p-6 text-white'>
      <h1 className='mb-6 text-2xl font-bold'>Add New Corrupted Rare</h1>
      <form
        onSubmit={(e) => {
          e.preventDefault();
          e.stopPropagation();
          form.handleSubmit();
        }}
        className='space-y-6'
      >
        <div className='grid grid-cols-1 gap-4 rounded-md bg-zinc-700 p-4'>
          {/* Item Name */}
          <form.Field
            name='item_name'
            children={(field) => (
              <div>
                <label className='mb-2 block text-sm font-medium'>
                  Item Name *
                </label>
                <input
                  type='text'
                  value={field.state.value?.toString() ?? ''}
                  onChange={(e) => field.handleChange(e.target.value)}
                  className='w-full rounded-md border border-gray-600 bg-zinc-800 px-3 py-2'
                  required
                />
              </div>
            )}
          />

          {/* Item Class */}
          <form.Field
            name='item_class'
            children={(field) => (
              <div>
                <label className='mb-2 block text-sm font-medium'>
                  Item Class *
                </label>
                <select
                  value={field.state.value}
                  onChange={(e) => {
                    field.handleChange(e.target.value);
                    // Clear base type and all affixes when item class changes
                    form.setFieldValue('base_type', '');
                    clearAllAffixes();
                  }}
                  className='w-full rounded-md border border-gray-600 bg-zinc-800 px-3 py-2'
                  required
                >
                  <option value=''>Select Item Class</option>
                  {ITEM_CLASSES.map((cls) => (
                    <option key={cls} value={cls}>
                      {cls}
                    </option>
                  ))}
                </select>
              </div>
            )}
          />

          {/* Base Type */}
          <form.Field
            name='base_type'
            children={(field) => (
              <div>
                <label className='mb-2 block text-sm font-medium'>
                  Base Type *
                </label>
                <select
                  value={field.state.value}
                  onChange={(e) => {
                    field.handleChange(e.target.value);
                    clearAllAffixes();
                  }}
                  className={`w-full rounded-md border border-gray-600 px-3 py-2 ${
                    !currentItemClass
                      ? 'cursor-not-allowed bg-zinc-700 opacity-50'
                      : 'bg-zinc-800'
                  }`}
                  disabled={!currentItemClass}
                  required
                >
                  <option value=''>
                    {!currentItemClass
                      ? 'Select Item Class First'
                      : 'Select Base Type'}
                  </option>
                  {getFilteredBases().map((base) => (
                    <option key={base.base_name} value={base.base_name}>
                      {base.base_name}
                    </option>
                  ))}
                </select>
              </div>
            )}
          />
        </div>

        <div className='grid grid-cols-1 gap-4 rounded-md bg-zinc-700 p-4 md:grid-cols-3'>
          {/* Sockets */}
          <form.Field
            name='sockets'
            children={(field) => (
              <div>
                <label className='mb-2 block text-sm font-medium'>
                  Sockets
                </label>
                <RangeSlider
                  values={[field.state.value || 0]}
                  onChange={(values) => field.handleChange(values[0])}
                  min={0}
                  max={3}
                  step={1}
                />
                <div className='mt-1 text-xs text-gray-400'>
                  Sockets: {field.state.value || 0}
                </div>
              </div>
            )}
          />

          {/* Enchant */}
          <form.Field
            name='enchant'
            children={(field) => (
              <div>
                <label className='mb-2 block text-sm font-medium'>
                  Enchant
                </label>
                <input
                  type='text'
                  value={field.state.value?.toString() ?? ''}
                  onChange={(e) => field.handleChange(e.target.value)}
                  className='w-full rounded-md border border-gray-600 bg-zinc-800 px-3 py-2'
                />
              </div>
            )}
          />

          {/* Implicit Value */}
          <form.Field
            name='implicit'
            children={(field) => (
              <div>
                <label className='mb-2 block text-sm font-medium'>
                  Implicit Value
                </label>
                {!currentBaseItem ? (
                  <div className='text-sm text-gray-500'>
                    Select a base type first
                  </div>
                ) : !currentBaseItem.implicit ? (
                  <div className='text-sm text-gray-500'>
                    This base has no implicit
                  </div>
                ) : !implicitRange ? (
                  <div className='text-sm text-gray-500'>
                    Fixed implicit: {currentBaseItem.implicit}
                  </div>
                ) : implicitRange.min === implicitRange.max ? (
                  <div>
                    <div className='mb-2 text-sm text-gray-500'>
                      Fixed value: {implicitRange.min}
                    </div>
                    <div className='text-xs text-gray-400'>
                      Base implicit: {currentBaseItem.implicit}
                    </div>
                  </div>
                ) : (
                  <div>
                    <RangeSlider
                      values={[field.state.value || implicitRange.min]}
                      onChange={(values) => field.handleChange(values[0])}
                      min={implicitRange.min}
                      max={implicitRange.max}
                      step={1}
                    />
                    <div className='mt-1 text-xs text-gray-400'>
                      Base implicit: {currentBaseItem.implicit}
                    </div>
                  </div>
                )}
              </div>
            )}
          />
        </div>

        {/* Prefixes */}
        <div className='space-y-4'>
          <h3 className='text-lg font-semibold'>Prefixes</h3>
          {[1, 2, 3].map((num) => (
            <div
              key={num}
              className='grid grid-cols-1 gap-4 rounded-md bg-zinc-700 p-4 md:grid-cols-3'
            >
              <form.Field
                name={`prefix${num}` as keyof ItemFormData}
                children={(field) => (
                  <div>
                    <label className='mb-2 block text-sm font-medium'>
                      Prefix {num}
                    </label>
                    <select
                      value={field.state.value as string}
                      onChange={(e) => field.handleChange(e.target.value)}
                      className={`w-full rounded-md border border-gray-600 px-3 py-2 ${
                        !currentBaseType
                          ? 'cursor-not-allowed bg-zinc-700 opacity-50'
                          : 'bg-zinc-800'
                      }`}
                      disabled={!currentBaseType}
                    >
                      <option value=''>
                        {!currentBaseType
                          ? 'Select Base Type First'
                          : 'Select Prefix'}
                      </option>
                      {getFilteredPrefixAffixesForSlot(num).map((affix) => (
                        <option key={affix.id} value={affix.affix_name}>
                          {affix.affix_name}
                        </option>
                      ))}
                    </select>
                  </div>
                )}
              />
              <PrefixValueField
                num={num}
                valueNum={1}
                form={form}
                look={look}
                extractMultipleRangesFromEffect={
                  extractMultipleRangesFromEffect
                }
              />
              <PrefixValueField
                num={num}
                valueNum={2}
                form={form}
                look={look}
                extractMultipleRangesFromEffect={
                  extractMultipleRangesFromEffect
                }
              />
            </div>
          ))}
        </div>

        {/* Suffixes */}
        <div className='space-y-4'>
          <h3 className='text-lg font-semibold'>Suffixes</h3>
          {[1, 2, 3].map((num) => (
            <div
              key={num}
              className='grid grid-cols-1 gap-4 rounded-md bg-zinc-700 p-4 md:grid-cols-2'
            >
              <form.Field
                name={`suffix${num}` as keyof ItemFormData}
                children={(field) => (
                  <div>
                    <label className='mb-2 block text-sm font-medium'>
                      Suffix {num}
                    </label>
                    <select
                      value={field.state.value as string}
                      onChange={(e) => field.handleChange(e.target.value)}
                      className={`w-full rounded-md border border-gray-600 px-3 py-2 ${
                        !currentBaseType
                          ? 'cursor-not-allowed bg-zinc-700 opacity-50'
                          : 'bg-zinc-800'
                      }`}
                      disabled={!currentBaseType}
                    >
                      <option value=''>
                        {!currentBaseType
                          ? 'Select Base Type First'
                          : 'Select Suffix'}
                      </option>
                      {getFilteredSuffixAffixesForSlot(num).map((affix) => (
                        <option key={affix.id} value={affix.affix_name}>
                          {affix.affix_name}
                        </option>
                      ))}
                    </select>
                  </div>
                )}
              />
              <SuffixValueField
                num={num}
                form={form}
                look={look}
                extractMultipleRangesFromEffect={
                  extractMultipleRangesFromEffect
                }
              />
            </div>
          ))}
        </div>

        {/* Submit Button */}
        <button
          type='submit'
          disabled={createItemMutation.isPending}
          className='w-full rounded-md bg-blue-600 px-4 py-2 font-medium text-white transition-colors hover:bg-blue-700 disabled:bg-gray-600'
        >
          {createItemMutation.isPending ? 'Creating...' : 'Create Item'}
        </button>
      </form>
    </div>
  );
}

export default Entry;
