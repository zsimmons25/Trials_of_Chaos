import { createFileRoute } from '@tanstack/react-router';
import Corruption from '../Corruption';

export const Route = createFileRoute('/corruption')({
  component: () => <Corruption />,
});
