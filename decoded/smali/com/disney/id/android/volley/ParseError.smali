.class public Lcom/disney/id/android/volley/ParseError;
.super Lcom/disney/id/android/volley/VolleyError;
.source "ParseError.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/disney/id/android/volley/VolleyError;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/disney/id/android/volley/NetworkResponse;)V
    .locals 0
    .param p1, "networkResponse"    # Lcom/disney/id/android/volley/NetworkResponse;

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lcom/disney/id/android/volley/VolleyError;-><init>(Lcom/disney/id/android/volley/NetworkResponse;)V

    .line 28
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lcom/disney/id/android/volley/VolleyError;-><init>(Ljava/lang/Throwable;)V

    .line 32
    return-void
.end method
