.class public interface abstract Lcom/disney/id/android/volley/Network;
.super Ljava/lang/Object;
.source "Network.java"


# virtual methods
.method public abstract performRequest(Lcom/disney/id/android/volley/Request;)Lcom/disney/id/android/volley/NetworkResponse;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disney/id/android/volley/Request",
            "<*>;)",
            "Lcom/disney/id/android/volley/NetworkResponse;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/disney/id/android/volley/VolleyError;
        }
    .end annotation
.end method
