import { createFileRoute } from '@tanstack/react-router';
import Rewards from '../Rewards';

export const Route = createFileRoute('/rewards')({
  component: () => <Rewards />,
});
