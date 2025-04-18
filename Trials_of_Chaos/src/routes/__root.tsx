import { createRootRoute, Link, Outlet } from '@tanstack/react-router';
import { TanStackRouterDevtools } from '@tanstack/react-router-devtools';

export const Route = createRootRoute({
  component: () => (
    <>
      <div className='flex gap-2 bg-neutral-800 p-2 text-slate-300'>
        <Link to='/' className='[&.active]:font-bold'>
          Home
        </Link>
        <Link to='/modifiers' className='[&.active]:font-bold'>
          Modifers
        </Link>
        <Link to='/monsters' className='[&.active]:font-bold'>
          Monsters
        </Link>
        <Link to='/rooms' className='[&.active]:font-bold'>
          Rooms
        </Link>
        <Link to='/rewards' className='[&.active]:font-bold'>
          Rewards
        </Link>
      </div>
      <hr />
      <Outlet />
      {import.meta.env.MODE != 'production' && <TanStackRouterDevtools />}
    </>
  ),
});
