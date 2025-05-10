import { useState } from 'react';

const defaultHeaders = ['Defeat', 'Survive', 'Cores', 'Idol', 'Blood'];
const altHeaders = ['Slay', 'Survive', 'Souls', 'Statue', 'Sacrifice'];

export default function Rooms() {
  const [useAlt, setUseAlt] = useState(false);
  const headers = useAlt ? altHeaders : defaultHeaders;

  return (
    <div className='h-screen w-screen bg-zinc-700 p-4 text-neutral-300'>
      <div className='mb-4 flex justify-end'>
        <div className='inline-flex overflow-hidden rounded border border-neutral-600'>
          <button
            onClick={() => setUseAlt(false)}
            className={`px-3 py-1 ${
              !useAlt
                ? 'bg-amber-500 text-zinc-900'
                : 'bg-zinc-800 text-neutral-300'
            }`}
          >
            DSCIB
          </button>
          <button
            onClick={() => setUseAlt(true)}
            className={`px-3 py-1 ${
              useAlt
                ? 'bg-amber-500 text-zinc-900'
                : 'bg-zinc-800 text-neutral-300'
            }`}
          >
            SSSSS
          </button>
        </div>
      </div>

      <div className='grid grid-cols-5 gap-4'>
        {headers.map((hdr) => (
          <div key={hdr} className='flex flex-col'>
            <h2 className='mb-2 text-center text-lg font-semibold'>{hdr}</h2>
            <div className='grid grid-rows-6 gap-2'>
              {Array.from({ length: 6 }).map((_, idx) => (
                <div
                  key={idx}
                  className='h-16 rounded border border-neutral-600 bg-zinc-800'
                />
              ))}
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
