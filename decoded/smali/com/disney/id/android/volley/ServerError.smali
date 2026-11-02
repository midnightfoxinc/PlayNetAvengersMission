.class public Lcom/disney/id/android/volley/ServerError;
.super Lcom/disney/id/android/volley/VolleyError;
.source "ServerError.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/disney/id/android/volley/VolleyError;-><init>()V

    .line 30
    return-void
.end method

.method public constructor <init>(Lcom/disney/id/android/volley/NetworkResponse;)V
    .locals 0
    .param p1, "networkResponse"    # Lcom/disney/id/android/volley/NetworkResponse;

    .prologue
    .line 25
    invoke-direct {p0, p1}, Lcom/disney/id/android/volley/VolleyError;-><init>(Lcom/disney/id/android/volley/NetworkResponse;)V

    .line 26
    return-void
.end method
