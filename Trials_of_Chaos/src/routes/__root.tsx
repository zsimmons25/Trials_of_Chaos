import { createRootRoute, Link, Outlet } from '@tanstack/react-router';
import { TanStackRouterDevtools } from '@tanstack/react-router-devtools';

function RootComponent() {
  return (
    <>
      <div className='flex gap-2 bg-neutral-800 p-2 text-slate-300'>
        <Link to='/' className='hover:text-gold [&.active]:font-bold'>
          Intro
        </Link>
        <Link
          to='/modifiers'
          preload='intent'
          className='hover:text-gold [&.active]:font-bold'
        >
          Modifers
        </Link>
        <Link
          to='/monsters'
          preload='intent'
          className='hover:text-gold [&.active]:font-bold'
        >
          Monsters
        </Link>
        <Link
          to='/rooms'
          preload='intent'
          className='hover:text-gold [&.active]:font-bold'
        >
          Rooms
        </Link>
        <Link
          to='/rewards'
          preload='intent'
          className='hover:text-gold [&.active]:font-bold'
        >
          Rewards
        </Link>
        <Link
          to='/corruption'
          preload='intent'
          className='hover:text-gold [&.active]:font-bold'
        >
          Corruption
        </Link>
        <Link
          to='/crafting'
          preload='intent'
          className='hover:text-gold [&.active]:font-bold'
        >
          Crafting
        </Link>
        <Link
          to='/chronicle'
          preload='intent'
          className='hover:text-gold [&.active]:font-bold'
        >
          Chronicle
        </Link>
        <Link
          to='/sanity'
          preload='intent'
          className='hover:text-gold [&.active]:font-bold'
        >
          Sanity
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
