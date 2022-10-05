import { Fragment } from 'inferno';
import { useBackend, useSharedState } from '../backend';
import { AnimatedNumber, Box, Button, LabeledList, Section } from '../components';
import { Window } from '../layouts';
import { AnalysisResults, ChemicalBuffer, ChemicalBufferEntry, PackagingControlsItem } from './ChemMaster.js';

export const AlchemyTable = (props, context) => {
  const { data } = useBackend(context);
  const { screen } = data;
  return (
    <Window
      width={465}
      height={550}
      resizable>
      <Window.Content scrollable>
        {screen === 'analyze' && (
          <AnalysisResults />
        ) || (
          <AlchemyTableContent />
        )}
      </Window.Content>
    </Window>
  );
};

const AlchemyTableContent = (props, context) => {
  const { act, data } = useBackend(context);
  const {
    screen,
    beakerContents = [],
    bufferContents = [],
    beakerCurrentVolume,
    beakerMaxVolume,
    isBeakerLoaded,
  } = data;
  if (screen === 'analyze') {
    return <AnalysisResults />;
  }
  return (
    <Fragment>
      <Section
        title="Beaker"
        buttons={!!data.isBeakerLoaded && (
          <Fragment>
            <Box inline color="label" mr={2}>
              <AnimatedNumber
                value={beakerCurrentVolume}
                initial={0} />
              {` / ${beakerMaxVolume} units`}
            </Box>
            <Button
              icon="eject"
              content="Eject"
              onClick={() => act('eject')} />
          </Fragment>
        )}>
        {!isBeakerLoaded && (
          <Box color="label" mt="3px" mb="5px">
            No beaker loaded.
          </Box>
        )}
        {!!isBeakerLoaded && beakerContents.length === 0 && (
          <Box color="label" mt="3px" mb="5px">
            Beaker is empty.
          </Box>
        )}
        <ChemicalBuffer>
          {beakerContents.map(chemical => (
            <ChemicalBufferEntry
              key={chemical.id}
              chemical={chemical}
              transferTo="buffer" />
          ))}
        </ChemicalBuffer>
      </Section>
      <Section
        title="Buffer"
        buttons={(
          <Fragment>
            <Box inline color="label" mr={1}>
              Mode:
            </Box>
            <Button
              color={data.mode ? 'good' : 'bad'}
              icon={data.mode ? 'exchange-alt' : 'times'}
              content={data.mode ? 'Transfer' : 'Destroy'}
              onClick={() => act('toggleMode')} />
          </Fragment>
        )}>
        {bufferContents.length === 0 && (
          <Box color="label" mt="3px" mb="5px">
            Buffer is empty.
          </Box>
        )}
        <ChemicalBuffer>
          {bufferContents.map(chemical => (
            <ChemicalBufferEntry
              key={chemical.id}
              chemical={chemical}
              transferTo="beaker" />
          ))}
        </ChemicalBuffer>
      </Section>
      <Section
        title="Packaging">
        <AlchemyPackagingControls />
      </Section>
    </Fragment>
  );
};

const AlchemyPackagingControls = (props, context) => {
  const { act, data } = useBackend(context);
  const [
    powderbagAmount,
    setPowderbagAmount,
  ] = useSharedState(context, 'powderbagAmount', 1);
  const [
    primitiveBottleAmount,
    setprimitiveBottleAmount,
  ] = useSharedState(context, 'primitiveBottleAmount', 1);
  return (
    <LabeledList>
      <PackagingControlsItem
        label="Powder Bag"
        amount={powderbagAmount}
        amountUnit="powderbags"
        sideNote="max 40u"
        onChangeAmount={(e, value) => setPowderbagAmount(value)}
        onCreate={() => act('create', {
          type: 'bag',
          amount: powderbagAmount,
          volume: 'auto',
        })} />
      <PackagingControlsItem
        label="Primitive Bottles"
        amount={primitiveBottleAmount}
        amountUnit="bottles"
        sideNote="max 60u"
        onChangeAmount={(e, value) => setprimitiveBottleAmount(value)}
        onCreate={() => act('create', {
          type: 'bottle_primitive',
          amount: primitiveBottleAmount,
          volume: 'auto',
        })} />
    </LabeledList>
  );
};
