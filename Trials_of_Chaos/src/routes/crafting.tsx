import { createFileRoute } from '@tanstack/react-router';
import Crafting from '../Crafting';

export const Route = createFileRoute('/crafting')({
  component: () => <Crafting />,
});
