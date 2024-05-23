mod core;
mod http;
mod sse;

use crate::core::{Core, Message};
use yew::{html, Component, Context, Html};
// use gloo_console::log;

#[derive(Default)]
pub struct RootComponent {
    core: Core,
}

impl Component for RootComponent {
    type Message = Message;
    type Properties = ();

    fn create(_ctx: &Context<Self>) -> Self {
        Self { core: core::new() }
    }

    fn view(&self, _ctx: &Context<Self>) -> Html {
        let _view = self.core.view();

        html! {
            <>
                <section class="section has-text-centered">
                    <h1 class="title">{"User Info"}</h1>
                </section>
            </>
        }
    }
}

fn main() {
    yew::Renderer::<RootComponent>::new().render();
}
