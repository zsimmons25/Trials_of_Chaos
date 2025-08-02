import { createRootRoute, Link, Outlet } from '@tanstack/react-router';
import { TanStackRouterDevtools } from '@tanstack/react-router-devtools';

function RootComponent() {
  return (
    <>
      <div className='flex items-center justify-between gap-6 bg-neutral-800 p-2 text-slate-300'>
        <Link
          to='/'
          className='ml-20 flex flex-col items-center hover:text-gold [&.active]:text-gold'
        >
          Intro
          <img
            className='h-10 w-10'
            src='/images/chimeral_ultimatum.webp'
            alt='Chimeral Ultimatum'
            draggable={false}
          />
        </Link>
        <Link
          to='/modifiers'
          preload='intent'
          className='flex flex-col items-center hover:text-gold [&.active]:text-gold'
        >
          Modifers
          <img
            className='h-10 w-10'
            src='/images/lethal_rare.png'
            alt='Lethal Rare'
            draggable={false}
          />
        </Link>
        <Link
          to='/monsters'
          preload='intent'
          className='flex flex-col items-center hover:text-gold [&.active]:text-gold'
        >
          Monsters
          <img
            className='h-10 w-10'
            src='/images/heart.webp'
            alt='Heart'
            draggable={false}
          />
        </Link>
        <Link
          to='/rooms'
          preload='intent'
          className='ml-2 flex flex-col items-center hover:text-gold [&.active]:text-gold'
        >
          Rooms
          <img
            className='h-10 w-10'
            src='/images/soul_core_mini.webp'
            alt='Soul Core'
            draggable={false}
          />
        </Link>
        <Link
          to='/rewards'
          preload='intent'
          className='ml-8 flex flex-col items-center hover:text-gold [&.active]:text-gold'
        >
          Rewards
          <img
            className='h-10 w-11'
            src='/images/rewards.png'
            alt='Rewards'
            draggable={false}
          />
        </Link>
        <Link
          to='/corruption'
          preload='intent'
          className='flex flex-col items-center hover:text-gold [&.active]:text-gold'
        >
          Corruption
          <img
            className='h-10 w-10'
            src='/images/Vaal Orb.png'
            alt='Vaal Orb'
            draggable={false}
          />
        </Link>
        <Link
          to='/crafting'
          preload='intent'
          className='flex flex-col items-center hover:text-gold [&.active]:text-gold'
        >
          Crafting
          <img
            className='h-10 w-10'
            src='/images/Chaos Orb.png'
            alt='Chaos Orb'
            draggable={false}
          />
        </Link>
        <Link
          to='/chronicle'
          preload='intent'
          className='flex flex-col items-center hover:text-gold [&.active]:text-gold'
        >
          Chronicle
          <img
            className='h-10 w-10'
            src='/images/time_paradox.png'
            alt='Time Paradox'
            draggable={false}
          />
        </Link>
        <Link
          to='/sanity'
          preload='intent'
          className='mr-20 flex flex-col items-center hover:text-gold [&.active]:text-gold'
        >
          Sanity
          <img
            className='h-10 w-10'
            src='/images/culmination.webp'
            alt='Culmination Support'
            draggable={false}
          />
        </Link>
      </div>
      <hr />
      <Outlet />
      {import.meta.env.MODE != 'production' && <TanStackRouterDevtools />}
    </>
  );
}

export const Route = createRootRoute({
  component: RootComponent,
});
