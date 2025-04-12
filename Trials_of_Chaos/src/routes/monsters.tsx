import { createFileRoute } from '@tanstack/react-router';
import Monsters from '../Monsters';

export const Route = createFileRoute('/monsters')({
  component: () => <Monsters />,
});
