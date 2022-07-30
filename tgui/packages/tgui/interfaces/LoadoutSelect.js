import { useBackend } from '../backend';
import { Window } from '../layouts';
import { Button, Flex, Tabs, Section, Stack } from '../components';

export const LoadoutSelect = (props, context) => {
  const { act, data } = useBackend(context);
  return (
    <Window width={500} height={450} resizable="false">
      <Window.Content>
        <Stack vertical fill fitted>
          <Stack.Item>
            <Tabs style={{ "vertical-align": "top" }}>
              {!(data.outfits?.length) && "No loadout options." || data.outfits.map(outfit => (
                <Tabs.Tab
                  key={outfit}
                  selected={data.selected === outfit}
                  onClick={() => act('loadout_select', {
                    name: outfit,
                  })}>
                  {outfit}
                </Tabs.Tab>
              ))}
            </Tabs>
          </Stack.Item>
          <Stack vertical fill>
            <Stack.Item grow={1} style={{ "vertical-align": "top" }}>
              <Section title="Contents" fitted fill scrollable>
                {!data.items?.length && "No outfit selected." || data.items.map(item => (
                  <Stack style={{ "margin": "10px 10px", "text-align": "center" }} key={`${item.name}`}>
                    <Stack.Item as="div" style={{ "-ms-transform": "scale(1.5)", "image-rendering": "pixelated", "-ms-interpolation-mode": "nearest-neighbor", "vertical-align": "middle", "height": "32px", "width": "32px" }} class={item.icon} />
                    <Stack.Item as="div" style={{ "display": "block", "vertical-align": "middle", "line-height": "32px", "margin": "auto" }}>
                      {item.name} {item.quantity > 1
                      && (`x${item.quantity}`)}<br />
                    </Stack.Item>
                  </Stack>))}
              </Section>
            </Stack.Item>
            <Stack.Item fill fitted>
              <Section fill>
                <Button style={{ "display": "block", "text-align": "center" }} content={"Finished"} onClick={() => act('loadout_confirm')} />
              </Section>
            </Stack.Item>
          </Stack>
        </Stack>
      </Window.Content>
    </Window>
  );
};
