.class public interface abstract Lcom/disney/id/android/volley/ResponseDelivery;
.super Ljava/lang/Object;
.source "ResponseDelivery.java"


# virtual methods
.method public abstract postError(Lcom/disney/id/android/volley/Request;Lcom/disney/id/android/volley/VolleyError;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disney/id/android/volley/Request",
            "<*>;",
            "Lcom/disney/id/android/volley/VolleyError;",
            ")V"
        }
    .end annotation
.end method

.method public abstract postResponse(Lcom/disney/id/android/volley/Request;Lcom/disney/id/android/volley/Response;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disney/id/android/volley/Request",
            "<*>;",
            "Lcom/disney/id/android/volley/Response",
            "<*>;)V"
        }
    .end annotation
.end method

.method public abstract postResponse(Lcom/disney/id/android/volley/Request;Lcom/disney/id/android/volley/Response;Ljava/lang/Runnable;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disney/id/android/volley/Request",
            "<*>;",
            "Lcom/disney/id/android/volley/Response",
            "<*>;",
            "Ljava/lang/Runnable;",
            ")V"
        }
    .end annotation
.end method
