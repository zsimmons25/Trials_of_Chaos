import modifiers_header_left from '/modifier_header_left.png';
import modifiers_header from '/modifier_header.png';
import modifiers_header_right from '/modifier_header_right.png';
import { useQuery } from '@tanstack/react-query';

type ModifiersData = {
  id: string;
  name: string;
  stages: number;
  stage1: boolean;
  stage2: boolean;
  stage3: boolean;
  description1: string;
  description2: string;
  description3: string;
  active: boolean;
  imgurl: string;
};

function Modifiers() {
  const {
    data: modifiers = [],
    isLoading,
    isError,
  } = useQuery<ModifiersData[]>({
    queryKey: ['modifiers'],
    queryFn: async () => {
      const response = await fetch(import.meta.env.VITE_UXMAL + '/modifiers');
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      return response.json();
    },
  });
  if (isLoading) {
    return <div>Loading...</div>;
  }
  if (isError) {
    return <div>Error loading modifiers.</div>;
  }
  return (
    <div className='h-screen w-screen bg-neutral-900 text-center text-neutral-300'>
      <div className='relative flex w-full flex-wrap items-center justify-center'>
        {modifiers
          .filter((modifier) => modifier.active)
          .map((modifier) => (
            <div
              key={modifier.id}
              className={`mx-2 my-4 flex h-60 w-60 flex-col items-center justify-center rounded-lg`}
            >
              <div className='flex flex-col items-center justify-center'>
                <img src={modifier.imgurl} />
              </div>
              <div className='bg-blood h- flex w-60 items-center justify-center border-x border-black'>
                <img
                  className='ml-1'
                  src={modifiers_header_left}
                  alt='Modifier Header Left'
                />
                <img src={modifiers_header} alt='Modifier Header' />
                <h1 className='text-gold absolute text-center'>
                  {modifier.name}
                </h1>
                <img
                  className='mr-1'
                  src={modifiers_header_right}
                  alt='Modifier Header Right'
                />
              </div>
              <div className='flex h-20 w-60 flex-col items-center justify-center bg-black bg-opacity-75'>
                <p>{modifier.description1}</p>
              </div>
            </div>
          ))}
      </div>
    </div>
  );
}

export default Modifiers;
