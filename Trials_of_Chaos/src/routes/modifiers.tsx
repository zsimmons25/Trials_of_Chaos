import Modifiers from '../Modifiers';
import { modifierqfn } from '../handlers/modifiersquery';
import { createFileRoute, Link } from '@tanstack/react-router';
import { queryClient } from '../main';
import { Outlet, useMatches } from '@tanstack/react-router';

const loader = async () => {
  await queryClient.ensureQueryData({
    queryKey: ['modifiers'],
    queryFn: modifierqfn,
  });
};

function ModifiersLayout() {
  const matches = useMatches();
  const isGameRoute = matches.some(
    (match) => match.routeId === '/modifiers/game'
  );
  return (
    <div className='min-h-screen bg-zinc-800'>
      {isGameRoute ? (
        <Outlet />
      ) : (
        <>
          <div className='pt-4 text-center'>
            <Link
              to='/modifiers/game'
              className='rounded-lg bg-red-700 px-6 py-3 text-xl text-black transition-colors hover:bg-red-500/80'
            >
              Begin Trial
            </Link>
          </div>
          <Modifiers />
        </>
      )}
    </div>
  );
}

export const Route = createFileRoute('/modifiers')({
  component: ModifiersLayout,
  loader,
});
