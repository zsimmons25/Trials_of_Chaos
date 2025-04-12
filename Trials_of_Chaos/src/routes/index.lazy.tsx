import { createLazyFileRoute } from '@tanstack/react-router';

export const Route = createLazyFileRoute('/')({
  component: () => (
    <div className='m-2 text-slate-300'>
      Welcome Challenger, to the Trials of Chaos!
    </div>
  ),
});
