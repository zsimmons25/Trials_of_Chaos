import { useForm } from '@tanstack/react-form';
import {
  useSuspenseQuery,
  useMutation,
  useQueryClient,
} from '@tanstack/react-query';
import { itemqfn, ItemsResponse } from './handlers/itemsquery';
import { affixqfn } from './handlers/affixesquery';
import { Affix } from './types/affixes';

interface ItemFormData {
  item_name: string;
  item_class: string;
  base_type: string;
  ilvl: number;
  enchant?: string;
  sockets?: number;
  implicit?: string;
  prefix1?: string;
  p1v1?: number;
  p1v2?: number;
  prefix2?: string;
  p2v1?: number;
  p2v2?: number;
  prefix3?: string;
  p3v1?: number;
  p3v2?: number;
  suffix1?: string;
  s1v?: number;
  suffix2?: string;
  s2v?: number;
  suffix3?: string;
  s3v?: number;
  corrupted: boolean;
  mirrored: boolean;
}

const createItem = async (itemData: ItemFormData) => {
  const response = await fetch(import.meta.env.VITE_UXMAL + '/items', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(itemData),
  });

  if (!response.ok) {
    throw new Error('Failed to create item');
  }

  return response.json();
};

function Entry() {
  const queryClient = useQueryClient();

  const { data: itemAndBaseData } = useSuspenseQuery<ItemsResponse>({
    queryKey: ['items'],
    queryFn: itemqfn,
    refetchOnWindowFocus: false,
  });
  const { bases } = itemAndBaseData;

  const { data: affixes } = useSuspenseQuery<Affix[]>({
    queryKey: ['affixes'],
    queryFn: affixqfn,
    refetchOnWindowFocus: false,
  });

  const prefixAffixes = affixes?.filter(
    (affix) => affix.affix_type === 'prefix'
  );
  const suffixAffixes = affixes?.filter(
    (affix) => affix.affix_type === 'suffix'
  );

  const createItemMutation = useMutation({
    mutationFn: createItem,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['items'] });
      alert('Item created successfully!');
    },
    onError: (error) => {
      alert(`Error creating item: ${error.message}`);
    },
  });

  const form = useForm({
    defaultValues: {
      item_name: '',
      item_class: '',
      base_type: '',
      ilvl: 80,
      enchant: '',
      sockets: 0,
      implicit: '',
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
      createItemMutation.mutate(value);
    },
  });

  const itemClasses = [
    'Quarterstaff',
    'Body Armour',
    'Crossbow',
    'Two Hand Sword',
    'Two Hand Axe',
    'Two Hand Mace',
    'One Hand Sword',
    'One Hand Axe',
    'One Hand Mace',
    'Spear',
    'Helmet',
    'Gloves',
    'Boots',
    'Belt',
    'Ring',
    'Amulet',
    'Quiver',
  ];

  return (
    <div className='mx-auto max-w-4xl bg-gray-900 p-6 text-white'>
      <h1 className='mb-6 text-2xl font-bold'>Create New Item</h1>

      <form
        onSubmit={(e) => {
          e.preventDefault();
          e.stopPropagation();
          form.handleSubmit();
        }}
        className='space-y-6'
      >
        {/* Basic Item Info */}
        <div className='grid grid-cols-1 gap-4 md:grid-cols-2'>
          <form.Field
            name='item_name'
            children={(field) => (
              <div>
                <label className='mb-2 block text-sm font-medium'>
                  Item Name *
                </label>
                <input
                  type='text'
                  value={field.state.value}
                  onChange={(e) => field.handleChange(e.target.value)}
                  className='w-full rounded-md border border-gray-600 bg-gray-800 px-3 py-2'
                  required
                />
              </div>
            )}
          />

          <form.Field
            name='item_class'
            children={(field) => (
              <div>
                <label className='mb-2 block text-sm font-medium'>
                  Item Class *
                </label>
                <select
                  value={field.state.value}
                  onChange={(e) => field.handleChange(e.target.value)}
                  className='w-full rounded-md border border-gray-600 bg-gray-800 px-3 py-2'
                  required
                >
                  <option value=''>Select Item Class</option>
                  {itemClasses.map((cls) => (
                    <option key={cls} value={cls}>
                      {cls}
                    </option>
                  ))}
                </select>
              </div>
            )}
          />

          <form.Field
            name='base_type'
            children={(field) => (
              <div>
                <label className='mb-2 block text-sm font-medium'>
                  Base Type *
                </label>
                <select
                  value={field.state.value}
                  onChange={(e) => field.handleChange(e.target.value)}
                  className='w-full rounded-md border border-gray-600 bg-gray-800 px-3 py-2'
                  required
                >
                  <option value=''>Select Base Type</option>
                  {bases.map((base) => (
                    <option key={base.id} value={base.base_name}>
                      {base.base_name}
                    </option>
                  ))}
                </select>
              </div>
            )}
          />

          <form.Field
            name='ilvl'
            children={(field) => (
              <div>
                <label className='mb-2 block text-sm font-medium'>
                  Item Level
                </label>
                <input
                  type='number'
                  value={field.state.value}
                  onChange={(e) => field.handleChange(parseInt(e.target.value))}
                  className='w-full rounded-md border border-gray-600 bg-gray-800 px-3 py-2'
                  min='1'
                  max='100'
                />
              </div>
            )}
          />
        </div>

        {/* Optional Fields */}
        <div className='grid grid-cols-1 gap-4 md:grid-cols-3'>
          <form.Field
            name='enchant'
            children={(field) => (
              <div>
                <label className='mb-2 block text-sm font-medium'>
                  Enchant
                </label>
                <input
                  type='text'
                  value={field.state.value}
                  onChange={(e) => field.handleChange(e.target.value)}
                  className='w-full rounded-md border border-gray-600 bg-gray-800 px-3 py-2'
                />
              </div>
            )}
          />

          <form.Field
            name='sockets'
            children={(field) => (
              <div>
                <label className='mb-2 block text-sm font-medium'>
                  Sockets
                </label>
                <input
                  type='number'
                  value={field.state.value}
                  onChange={(e) => field.handleChange(parseInt(e.target.value))}
                  className='w-full rounded-md border border-gray-600 bg-gray-800 px-3 py-2'
                  min='0'
                  max='6'
                />
              </div>
            )}
          />

          <form.Field
            name='implicit'
            children={(field) => (
              <div>
                <label className='mb-2 block text-sm font-medium'>
                  Implicit
                </label>
                <input
                  type='text'
                  value={field.state.value}
                  onChange={(e) => field.handleChange(e.target.value)}
                  className='w-full rounded-md border border-gray-600 bg-gray-800 px-3 py-2'
                />
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
              className='grid grid-cols-1 gap-4 rounded-md bg-gray-800 p-4 md:grid-cols-3'
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
                      className='w-full rounded-md border border-gray-600 bg-gray-700 px-3 py-2'
                    >
                      <option value=''>Select Prefix</option>
                      {prefixAffixes.map((affix) => (
                        <option key={affix.id} value={affix.affix_name}>
                          {affix.affix_name}
                        </option>
                      ))}
                    </select>
                  </div>
                )}
              />

              <form.Field
                name={`p${num}v1` as keyof ItemFormData}
                children={(field) => (
                  <div>
                    <label className='mb-2 block text-sm font-medium'>
                      Value 1
                    </label>
                    <input
                      type='number'
                      value={(field.state.value as number) || ''}
                      onChange={(e) =>
                        field.handleChange(
                          e.target.value ? parseInt(e.target.value) : undefined
                        )
                      }
                      className='w-full rounded-md border border-gray-600 bg-gray-700 px-3 py-2'
                    />
                  </div>
                )}
              />

              <form.Field
                name={`p${num}v2` as keyof ItemFormData}
                children={(field) => (
                  <div>
                    <label className='mb-2 block text-sm font-medium'>
                      Value 2
                    </label>
                    <input
                      type='number'
                      value={(field.state.value as number) || ''}
                      onChange={(e) =>
                        field.handleChange(
                          e.target.value ? parseInt(e.target.value) : undefined
                        )
                      }
                      className='w-full rounded-md border border-gray-600 bg-gray-700 px-3 py-2'
                    />
                  </div>
                )}
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
              className='grid grid-cols-1 gap-4 rounded-md bg-gray-800 p-4 md:grid-cols-2'
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
                      className='w-full rounded-md border border-gray-600 bg-gray-700 px-3 py-2'
                    >
                      <option value=''>Select Suffix</option>
                      {suffixAffixes.map((affix) => (
                        <option key={affix.id} value={affix.affix_name}>
                          {affix.affix_name}
                        </option>
                      ))}
                    </select>
                  </div>
                )}
              />

              <form.Field
                name={`s${num}v` as keyof ItemFormData}
                children={(field) => (
                  <div>
                    <label className='mb-2 block text-sm font-medium'>
                      Value
                    </label>
                    <input
                      type='number'
                      value={(field.state.value as number) || ''}
                      onChange={(e) =>
                        field.handleChange(
                          e.target.value ? parseInt(e.target.value) : undefined
                        )
                      }
                      className='w-full rounded-md border border-gray-600 bg-gray-700 px-3 py-2'
                    />
                  </div>
                )}
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
