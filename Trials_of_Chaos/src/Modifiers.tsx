import modifiers_header_left from '/modifier_header_left.png';
import modifiers_header from '/modifier_header.png';
import modifiers_header_right from '/modifier_header_right.png';
import red_marker from '/marker_red_.png';
import { Modifier, ModifiersData } from './types/modifier';
import { Value } from '@sinclair/typebox/value';
import { useQuery } from '@tanstack/react-query';
import { useState } from 'react';

function Modifiers() {
  const {
    data: modifiers = [],
    isLoading,
    isError,
  } = useQuery<Modifier[]>({
    queryKey: ['modifiers'],
    queryFn: async () => {
      const response = await fetch(import.meta.env.VITE_UXMAL + '/modifiers');
      const res = await response.json();
      if (!response.ok) {
        throw new Error('Network response was not ok');
      } else if (!Value.Check(ModifiersData, res)) {
        console.log('Response:', res);
        console.error('Validation error:', Value.Errors(ModifiersData, res));
        throw new Error('Validation error');
      }
      console.log('Validation successful!');
      return res;
    },
  });
  const [selectedStages, setSelectedStages] = useState<Record<string, number>>(
    {}
  );
  const handleStageSelect = (modifierId: number, stage: number) => {
    setSelectedStages((prev) => ({
      ...prev,
      [modifierId]: stage,
    }));
  };
  const SelectedDescription = (modifier: Modifier) => {
    const stage = selectedStages[modifier.id] || 1;
    switch (stage) {
      case 1:
        return modifier.description1;
      case 2:
        return modifier.description2;
      case 3:
        return modifier.description3;
      default:
        return modifier.description1;
    }
  };
  if (isLoading) {
    return <div>Loading...</div>;
  }
  if (isError) {
    return <div>Error loading modifiers.</div>;
  }
  return (
    <div className='h-screen w-screen bg-neutral-900 text-center text-neutral-300'>
      <div className='relative mt-8 flex w-full flex-wrap items-center justify-center'>
        {modifiers
          .filter((modifier) => modifier.active)
          .map((modifier) => (
            <div
              key={modifier.id}
              className={`mx-2 my-8 flex h-64 w-60 flex-col items-center justify-center rounded-lg`}
            >
              <div className='flex flex-col items-center justify-center'>
                <img src={modifier.imgurl} />
              </div>
              <div className='flex h-16 w-60 items-center justify-center border-x border-black bg-blood'>
                <img
                  className='ml-1'
                  src={modifiers_header_left}
                  alt='Modifier Header Left'
                />
                <img src={modifiers_header} alt='Modifier Header' />
                <h1 className='absolute text-center text-gold'>
                  {modifier.name}
                </h1>
                <img
                  className='mr-1'
                  src={modifiers_header_right}
                  alt='Modifier Header Right'
                />
              </div>
              <div className='flex h-32 w-60 flex-col items-center justify-center bg-black bg-opacity-75'>
                <p className='flex h-32 items-center'>
                  {SelectedDescription(modifier)}
                </p>
              </div>
              <div className='flex min-h-10 w-60 items-center justify-between'>
                {modifier.stages > 1 && modifier.stage2 != false && (
                  <div className='flex h-10 w-full items-center justify-between'>
                    <button
                      className='hover:bg-gold/80 flex h-10 w-full items-center justify-center rounded-lg bg-opacity-90'
                      onClick={() => handleStageSelect(modifier.id, 1)}
                    >
                      <img
                        className='h-8 w-4'
                        src={red_marker}
                        alt='red_marker'
                      />
                    </button>
                    <button
                      className='hover:bg-gold/80 flex h-10 w-full items-center justify-center rounded-lg bg-opacity-90'
                      onClick={() => handleStageSelect(modifier.id, 2)}
                    >
                      <img
                        className='h-8 w-4'
                        src={red_marker}
                        alt='red_marker'
                      />
                      <img
                        className='h-8 w-4'
                        src={red_marker}
                        alt='red_marker'
                      />
                    </button>
                    {modifier.stages > 2 && modifier.stage3 != false && (
                      <button
                        className='hover:bg-gold/80 flex h-10 w-full items-center justify-center rounded-lg bg-opacity-90'
                        onClick={() => handleStageSelect(modifier.id, 3)}
                      >
                        <img
                          className='h-8 w-4'
                          src={red_marker}
                          alt='red_marker'
                        />
                        <img
                          className='h-8 w-4'
                          src={red_marker}
                          alt='red_marker'
                        />
                        <img
                          className='h-8 w-4'
                          src={red_marker}
                          alt='red_marker'
                        />
                      </button>
                    )}
                  </div>
                )}
              </div>
            </div>
          ))}
      </div>
    </div>
  );
}

export default Modifiers;
