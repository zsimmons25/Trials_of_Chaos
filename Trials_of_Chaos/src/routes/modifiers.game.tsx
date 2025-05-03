import ModifierGame from '../ModifierGame';
import { createFileRoute } from '@tanstack/react-router';

export const Route = createFileRoute('/modifiers/game')({
  component: () => <ModifierGame />,
});
