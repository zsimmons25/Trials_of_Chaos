import { createFileRoute } from '@tanstack/react-router';
import Rooms from '../Rooms';

export const Route = createFileRoute('/rooms')({
  component: () => <Rooms />,
});
