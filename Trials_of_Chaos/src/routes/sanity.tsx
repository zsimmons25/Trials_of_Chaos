import { createFileRoute } from '@tanstack/react-router';
import Sanity from '../Sanity';

export const Route = createFileRoute('/sanity')({
  component: () => <Sanity />,
});
