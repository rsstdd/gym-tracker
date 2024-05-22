use gloo_console::log;
use shared::{App, Capabilities, Effect, Event};
use std::rc::Rc;
use yew::{platform::spawn_local, Callback};

use crate::http;

pub type Core = Rc<shared::Core<Effect, App>>;

pub enum Message {
    Event(Event),
    Effect(Effect),
}

pub fn new() -> Core {
    Rc::new(shared::Core::new::<Capabilities>())
}

pub fn update(core: &Core, event: Event, callback: &Callback<Message>) {
    log!(format!("event: {:?}", event));

    for effect in core.process_event(event) {
        process_effect(core, effect, callback);
    }
}

pub fn process_effect(core: &Core, effect: Effect, callback: &Callback<Message>) {
    log!(format!("effect: {:?}", effect));
    match effect {
        render @ Effect::Render(_) => callback.emit(Message::Effect(render)),

        Effect::Http(mut request) => {
            spawn_local({
                let core = core.clone();
                let callback = callback.clone();

                async move {
                    let response = http::request(&request.operation).await;

                    for effect in core.resolve(&mut request, response.into()) {
                        process_effect(&core, effect, &callback);
                    }
                }
            });
        }
    }
}
