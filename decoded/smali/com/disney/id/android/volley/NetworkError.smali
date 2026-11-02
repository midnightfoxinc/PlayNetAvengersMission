.class public Lcom/disney/id/android/volley/NetworkError;
.super Lcom/disney/id/android/volley/VolleyError;
.source "NetworkError.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Lcom/disney/id/android/volley/VolleyError;-><init>()V

    .line 26
    return-void
.end method

.method public constructor <init>(Lcom/disney/id/android/volley/NetworkResponse;)V
    .locals 0
    .param p1, "networkResponse"    # Lcom/disney/id/android/volley/NetworkResponse;

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lcom/disney/id/android/volley/VolleyError;-><init>(Lcom/disney/id/android/volley/NetworkResponse;)V

    .line 34
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lcom/disney/id/android/volley/VolleyError;-><init>(Ljava/lang/Throwable;)V

    .line 30
    return-void
.end method
