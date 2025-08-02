import React from 'react';
import { useRanger } from '@tanstack/react-ranger';

export const RangeSlider = ({
  values,
  onChange,
  min,
  max,
  step = 1,
  disabled = false,
  color = 'blue',
}: {
  values: number[];
  onChange: (values: number[]) => void;
  min: number;
  max: number;
  step?: number;
  disabled?: boolean;
  color?: 'blue' | 'yellow';
}) => {
  const trackElRef = React.useRef<HTMLDivElement>(null);

  const rangerInstance = useRanger({
    values: values,
    onChange: (instance) => {
      onChange([...instance.sortedValues]);
    },
    min,
    max,
    stepSize: step,
    getRangerElement: () => trackElRef.current,
  });

  if (disabled || min === max) {
    return (
      <div className='mt-2'>
        <div className='text-xs text-zinc-300'>Value: {values[0]} (fixed)</div>
      </div>
    );
  }

  const currentValue = rangerInstance.sortedValues[0] ?? values[0];
  const percentage = rangerInstance.getPercentageForValue(currentValue);

  const colorClasses =
    color === 'blue'
      ? {
          track: 'bg-blue-600',
          handle: 'bg-blue-500 hover:bg-blue-400',
          ring: 'focus:ring-blue-400',
        }
      : {
          track: 'bg-yellow-600',
          handle: 'bg-yellow-500 hover:bg-yellow-400',
          ring: 'focus:ring-yellow-400',
        };

  return (
    <div className='mt-2'>
      <div className='mb-1 flex items-center justify-between text-xs text-zinc-300'>
        <span>Value: {currentValue}</span>
        <span>
          ({min}-{max})
        </span>
      </div>
      <div className='flex h-4 items-center'>
        <div
          ref={trackElRef}
          className='relative h-1 w-full cursor-pointer rounded-sm bg-gray-700 transition-colors duration-150 hover:bg-gray-600'
        >
          <div
            className={`absolute inset-y-0 left-0 rounded-sm ${colorClasses.track} transition-all duration-150 ease-out`}
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
              className={`absolute top-1/2 h-4 w-4 -translate-x-1/2 -translate-y-1/2 transform cursor-grab rounded-full border-2 border-white ${colorClasses.handle} shadow-lg transition-all duration-150 ease-out hover:scale-105 ${colorClasses.ring} focus:outline-none focus:ring-2 focus:ring-opacity-50 active:cursor-grabbing`}
            />
          ))}
        </div>
      </div>
    </div>
  );
};
