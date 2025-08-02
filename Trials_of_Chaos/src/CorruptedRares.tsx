import React from 'react';
import { useSuspenseQuery } from '@tanstack/react-query';
import { itemqfn, ItemsResponse } from './handlers/itemsquery';
import { affixqfn } from './handlers/affixesquery';
import { Affix } from './types/affixes';
import { ItemDisplay } from './ItemDisplay';
import { CRVirtualizer } from './CRVirtualizer';

function CorruptedRares() {
  const [currentItemIndex, setCurrentItemIndex] = React.useState(0);
  const [showAllItems, setShowAllItems] = React.useState(false);

  const { data: itemAndBaseData } = useSuspenseQuery<ItemsResponse>({
    queryKey: ['items'],
    queryFn: itemqfn,
    refetchOnWindowFocus: false,
  });
  const { items, bases } = itemAndBaseData!;

  const { data: affixes } = useSuspenseQuery<Affix[]>({
    queryKey: ['affixes'],
    queryFn: affixqfn,
    refetchOnWindowFocus: false,
  });

  const getRandomItem = React.useCallback(() => {
    if (items.length > 0) {
      const randomIndex = Math.floor(Math.random() * items.length);
      setCurrentItemIndex(randomIndex);
    }
  }, [items]);

  React.useEffect(() => {
    getRandomItem();
  }, [getRandomItem]);

  React.useEffect(() => {
    const handleKeyDown = (event: KeyboardEvent) => {
      if (event.key === 'Escape' && showAllItems) {
        setShowAllItems(false);
      }
    };
    document.addEventListener('keydown', handleKeyDown);
    return () => {
      document.removeEventListener('keydown', handleKeyDown);
    };
  }, [showAllItems]);

  const currentItem = items[currentItemIndex];

  if (!currentItem || !bases || !affixes) {
    return <div className='p-4 text-center'>Loading...</div>;
  }

  return (
    <>
      <div className='flex flex-col items-center gap-8 p-4'>
        <div className='flex min-h-80 items-center justify-center'>
          <ItemDisplay
            item={currentItem}
            bases={bases}
            affixes={affixes}
            rarity='rare'
          />
        </div>
        <div className='flex gap-4'>
          <button
            onClick={() => setShowAllItems(true)}
            className='rounded-md bg-red-700 px-6 py-3 font-medium text-black hover:bg-red-500/80'
          >
            View All ({items.length})
          </button>
          <button
            onClick={getRandomItem}
            className='rounded-md bg-yellow-600 px-6 py-3 font-medium text-black hover:bg-yellow-400/80'
          >
            Get Random Item
          </button>
        </div>
      </div>

      {showAllItems && (
        <CRVirtualizer
          items={items}
          bases={bases}
          affixes={affixes}
          onClose={() => setShowAllItems(false)}
        />
      )}
    </>
  );
}

export default CorruptedRares;
