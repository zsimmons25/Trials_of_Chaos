import { createLazyFileRoute } from '@tanstack/react-router';
import { useSuspenseQuery } from '@tanstack/react-query';
import { modifierqfn } from './../handlers/modifiersquery';
import type { Modifier } from './../types/modifier';
import modifiers_header_left from '/modifier_header_left.png';
import modifiers_header from '/modifier_header.png';
import modifiers_header_right from '/modifier_header_right.png';
import Xyclucian from '/Xyclucian.png';
import Chimeral from '/Chimeral.png';

export const Route = createLazyFileRoute('/')({
  component: () => {
    const { data: modifiers = [] } = useSuspenseQuery<Modifier[]>({
      queryKey: ['modifiers'],
      queryFn: modifierqfn,
      select: (all) => all.filter((m) => m.active).slice(21, 24),
      refetchOnWindowFocus: false,
      refetchOnMount: false,
      refetchOnReconnect: false,
    });

    return (
      <div className='mx-auto flex min-h-screen w-6/12 justify-center bg-zinc-800 py-8'>
        <div className='mx-auto w-full max-w-4xl px-6 text-slate-300'>
          <h1 className='mb-4 text-2xl font-bold'>
            Welcome Challenger, to the Trials of Chaos!
          </h1>

          <h2 className='mb-3 mt-5 text-xl font-semibold'>Initial Quest</h2>
          <p className='mb-3'>
            Along your travels in Wraeclast, you will venture into the jungles
            of the <strong>Vaal Empire</strong>.
          </p>
          <p className='mb-3'>
            Here in the <strong>Chimeral Wetlands</strong>, you will discover
            the entrance to the <strong>Temple of Chaos</strong>, a place of
            great power and danger, where you will need to complete the
            Trialmaster's Challenges known as the{' '}
            <strong>Trials of Chaos.</strong>
          </p>
          <p className='mb-3'>
            To access the Trials, you must first defeat{' '}
            <strong>Xyclucian, the Chimera</strong>. This formidable foe drops a{' '}
            <strong>Chimeral Inscribed Ultimatum</strong>.
          </p>
          <div className='mb-4 flex items-center justify-center gap-8'>
            <img className='h-60 w-60' src={Xyclucian} alt='' />
            <img className='h-60 w-80' src={Chimeral} alt='' />
          </div>
          <p className='mb-3'>
            Bring this <strong>Chimeral Inscribed Ultimatum</strong> to the{' '}
            <strong>Temple of Chaos</strong> and place it on the altar for
            sacrifice. This will allow you to begin a Trial of 4 rooms
            consisting of killing monsters, surviving an onslaught, one
            intricate objective, and defeating a powerful boss.
          </p>
          <p className='mb-3'>
            Completing this <strong>Trial of Chaos</strong> will earn you 2
            Ascendancy Points. If you fail, the{' '}
            <strong>Chimeral Inscribed Ultimatum</strong> may be retrieved from
            the altar allowing you to attempt the Trial again.
          </p>

          <h3 className='mb-3 mt-5 text-xl font-semibold'>Endgame</h3>
          <p className='mb-3'>
            Beyond the initial quest, the <strong>Trials of Chaos</strong>{' '}
            extend into endgame. You can find{' '}
            <strong>Inscribed Ultimatums</strong> that contain up to 10 rooms.
            These allow you to take on even greater risks for more substantial
            rewards, acquire more Ascendancy Points, and ultimately face the{' '}
            <strong>Trialmaster</strong> himself in a challenging pinnacle
            fight.
          </p>
          <p>
            If you falter and die, you will lose all your rewards and the Trial
            will end, requiring another <strong>Ultimatum</strong> to enter a
            new Trial.
          </p>

          <h2 className='mb-3 mt-5 text-xl font-semibold'>Trial Mechanics</h2>
          <p className='mb-3'>
            The <strong>Trials of Chaos</strong> are a series of perilous rooms
            designed to test your luck and skill. As you enter each room, the{' '}
            <strong>Trialmaster</strong> will offer a choice of three modifiers,
            which you must adapt to and overcome in order to succeed.
          </p>
          <div className='my-12 flex flex-wrap justify-center gap-4'>
            {modifiers.map((modifier) => (
              <div
                key={modifier.id}
                className={`flex h-48 w-60 flex-col items-center justify-center rounded-lg`}
              >
                <div className='flex flex-col items-center justify-center'>
                  <img src={modifier.imgurl} />
                </div>
                <div className='flex h-16 w-60 items-center justify-center border-x border-black bg-blood'>
                  <img className='ml-1' src={modifiers_header_left} alt='mhl' />
                  <img src={modifiers_header} alt='mh' />
                  <h1 className='absolute text-center text-gold'>
                    {modifier.name}
                  </h1>
                  <img
                    className='mr-1'
                    src={modifiers_header_right}
                    alt='mhr'
                  />
                </div>
                <div className='flex h-32 w-60 flex-col items-center justify-center bg-black bg-opacity-75'>
                  <p className='mx-1 flex h-32 items-center'>
                    {modifier.description1}
                  </p>
                </div>
              </div>
            ))}
          </div>
          <p className='mb-3'>
            If your luck has run out, you may also choose to take the rewards
            you have earned and leave the Trial early.
          </p>
          <p className='mb-3'>
            Trial Rooms feature a variety of objectives to complete.
          </p>
          <p className='mb-3'>
            Listed below are the Trial objectives with their corresponding room
            numbers:
          </p>
          <ul className='mb-3 ml-4 list-inside list-disc'>
            <li>Defeat all Monsters ( 1 | 5 | 8 )</li>
            <li>Survive until the Timer expires ( 2 | 6 | 9 )</li>
            <li>Retrieve the Soul Cores ( 3 | 6 | 9 )</li>
            <li>Escort the Stone Idol ( 3 | 6 | 9 )</li>
            <li>Sacrifice Monsters to offer Blood ( 3 | 6 | 9 )</li>
            <li>Vanquish a powerful Boss ( 4 | 7 | 10 )</li>
          </ul>
        </div>
      </div>
    );
  },
});
