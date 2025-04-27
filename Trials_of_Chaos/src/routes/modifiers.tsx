import Modifiers from '../Modifiers';
import { modifierqfn } from '../handlers/modifiersquery';
import { createFileRoute } from '@tanstack/react-router';
import { queryClient } from '..//main';

const loader = async () => {
  await queryClient.ensureQueryData({
    queryKey: ['modifiers'],
    queryFn: modifierqfn,
  });
};

export const Route = createFileRoute('/modifiers')({
  component: Modifiers,
  loader,
});
