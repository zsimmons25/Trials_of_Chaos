import React from 'react';
import { useVirtualizer } from '@tanstack/react-virtual';
import { ItemDisplay } from './ItemDisplay';
import { Affix } from './types/affixes';

interface CRVirtualizerProps {
  items: any[];
  bases: any[];
  affixes: Affix[];
  onClose: () => void;
}

export const CRVirtualizer: React.FC<CRVirtualizerProps> = ({
  items,
  bases,
  affixes,
  onClose,
}) => {
  const parentRef = React.useRef<HTMLDivElement>(null);
  const [containerWidth, setContainerWidth] = React.useState(1200);

  const itemWidth = 550; // Width of ItemDisplay
  const itemsPerRow = Math.max(1, Math.floor(containerWidth / itemWidth));
  const rowCount = Math.ceil(items.length / itemsPerRow);

  React.useEffect(() => {
    const updateWidth = () => {
      if (parentRef.current) {
        setContainerWidth(parentRef.current.offsetWidth);
      }
    };
    updateWidth();
    window.addEventListener('resize', updateWidth);
    return () => window.removeEventListener('resize', updateWidth);
  }, []); // Empty dependency array to run only on mount and unmount

  const virtualizer = useVirtualizer({
    count: rowCount,
    getScrollElement: () => parentRef.current,
    estimateSize: () => 500, // Estimated height of ItemDisplay
    overscan: 2,
  });

  return (
    <div className='fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-75'>
      <div className='flex h-[95vh] w-[95vw] flex-col rounded-lg bg-zinc-700 shadow-2xl'>
        {/* Modal Header */}
        <div className='flex items-center justify-between border-b border-gray-700 p-2'>
          <h2 className='text-2xl font-bold text-white'>
            All Corrupted Rares ({items.length})
          </h2>
          <button
            onClick={onClose}
            className='flex h-8 w-8 items-center justify-center rounded-full bg-gray-700 text-white transition-colors hover:bg-gray-600 focus:outline-none focus:ring-2 focus:ring-gray-500'
          >
            ✕
          </button>
        </div>
        {/* Modal Body - Virtualized Grid */}
        <div className='flex-1 overflow-hidden p-1'>
          {' '}
          <div
            ref={parentRef}
            className='h-full w-full overflow-auto rounded-lg border border-gray-600 bg-zinc-800'
          >
            <div
              style={{
                height: `${virtualizer.getTotalSize()}px`,
                width: '100%',
                position: 'relative',
              }}
            >
              {virtualizer.getVirtualItems().map((virtualRow) => {
                const startIndex = virtualRow.index * itemsPerRow;
                const endIndex = Math.min(
                  startIndex + itemsPerRow,
                  items.length
                );
                const rowItems = items.slice(startIndex, endIndex);

                return (
                  <div
                    key={virtualRow.key}
                    style={{
                      position: 'absolute',
                      top: 0,
                      left: 0,
                      width: '100%',
                      height: `${virtualRow.size}px`,
                      transform: `translateY(${virtualRow.start}px)`,
                    }}
                  >
                    <div className='flex flex-wrap p-1'>
                      {' '}
                      {rowItems.map((item) => (
                        <ItemDisplay
                          key={item.id || item.item_name}
                          item={item}
                          bases={bases}
                          affixes={affixes}
                        />
                      ))}
                    </div>
                  </div>
                );
              })}
            </div>
          </div>
        </div>
        {/* Modal Footer */}
        <div className='border-t border-gray-700 p-2'>
          <div className='flex items-center justify-between'>
            <div className='text-gray-400'>
              Scroll to browse all {items.length} items
            </div>
            <button
              onClick={onClose}
              className='rounded-md bg-gray-600 px-6 py-2 font-medium text-white transition-colors hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-gray-500 focus:ring-offset-2'
            >
              Close
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};
