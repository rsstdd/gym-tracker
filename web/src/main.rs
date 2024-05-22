mod core;
mod http;

use crate::core::{Core, Message};
use shared::Event;
use yew::prelude::*;

#[derive(Default)]
struct RootComponent {
    core: Core,
}

impl Component for RootComponent {
    type Message = Message;
    type Properties = ();

    fn create(ctx: &Context<Self>) -> Self {
        ctx.link().send_message(Message::Event(Event::LoadUserData));

        Self { core: core::new() }
    }

    fn update(&mut self, ctx: &Context<Self>, msg: Self::Message) -> bool {
        let link = ctx.link().clone();
        let callback = Callback::from(move |msg| {
            link.send_message(msg);
        });
        if let Message::Event(event) = msg {
            core::update(&self.core, event, &callback);
            false
        } else {
            true
        }
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        let view = self.core.view();

        html! {
            <>
                <section class="section has-text-centered">
                    <h1 class="title">{"User Info"}</h1>
                    <p class="is-size-5">{&view.user.name}</p>
                </section>
            </>
        }
    }
}

fn main() {
    yew::Renderer::<RootComponent>::new().render();
}
