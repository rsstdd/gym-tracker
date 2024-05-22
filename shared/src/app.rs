use crux_core::render::Render;
use crux_http::{Http, HttpError};
use serde::{Deserialize, Serialize};

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
                let url = "/api/user";
                caps.http.get(url).expect_json().send(Event::SetUser);
            }
            Event::SetUser(Ok(mut response)) => {
                if let Some(user) = response.take_body() {
                    model.user = Some(user);
                    caps.render.render();
                }
            }
            Event::SetUser(Err(e)) => {
                eprintln!("Error fetching user data: {:?}", e);
            }
        }
    }

    fn view(&self, model: &Self::Model) -> Self::ViewModel {
        ViewModel {
            user: model.user.clone().unwrap_or_default(),
        }
    }
}
