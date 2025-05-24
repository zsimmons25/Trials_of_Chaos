import { createFileRoute } from '@tanstack/react-router';
import Chronicle from '../Chronicle';

export const Route = createFileRoute('/chronicle')({
  component: () => <Chronicle />,
});
