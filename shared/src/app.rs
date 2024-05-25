use crux_core::render::Render;
use crux_http::{Http, HttpError};
use serde::{Deserialize, Serialize};
use url::Url;
use crate::capabilities::sse::ServerSentEvents;

const API_URL: &str = "localhost:8080/users";

#[derive(Default, Serialize)]
pub struct Model {
    user: Option<User>,
}

#[derive(Serialize, Deserialize, Clone, Debug, PartialEq, Default)]
pub struct User {
    id: String,
    name: String,
    email: String,
}

#[derive(Serialize, Deserialize, Clone, Debug)]
pub struct ViewModel {
    pub user: User,
}

#[derive(Serialize, Deserialize, Clone, Debug)]
pub enum Event {
    LoadUserData,
    SetUser(Result<crux_http::Response<User>, HttpError>),
}

#[cfg_attr(feature = "typegen", derive(crux_core::macros::Export))]
#[derive(crux_core::macros::Effect)]
pub struct Capabilities {
    pub render: Render<Event>,
    pub http: Http<Event>,
}

#[derive(Default)]
pub struct App;

impl crux_core::App for App {
    type Model = Model;
    type Event = Event;
    type ViewModel = ViewModel;
    type Capabilities = Capabilities;

    fn update(&self, msg: Self::Event, model: &mut Self::Model, caps: &Self::Capabilities) {
        match msg {
            Event::LoadUserData => {
                caps.http.get(API_URL).expect_json().send(Event::Set);
            }
        }
    }

    fn view(&self, model: &Self::Model) -> Self::ViewModel {
        ViewModel {
            user: model.user.clone().unwrap_or_default(),
        }
    }
}
