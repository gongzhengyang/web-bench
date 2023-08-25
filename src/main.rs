use axum::{
    routing::get,
    Router,
    Json,
    response::IntoResponse
};

#[tokio::main]
async fn main() {
    // build our application with a single route
    let app = Router::new().route("/ping", get(hello));

    // run it with hyper on localhost:3000
    axum::Server::bind(&"0.0.0.0:9999".parse().unwrap())
        .serve(app.into_make_service())
        .await
        .unwrap();
}

async fn hello() -> impl IntoResponse {
    Json(serde_json::json!({
        "message": "pong"
    }))
}