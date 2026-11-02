.class public Lcom/disney/id/android/guestcontroller/GuestControllerError;
.super Lcom/disney/id/android/volley/VolleyError;
.source "GuestControllerError.java"


# instance fields
.field private guestControllerResponse:Lcom/disney/id/android/guestcontroller/GuestControllerResponse;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 17
    invoke-direct {p0, p1}, Lcom/disney/id/android/volley/VolleyError;-><init>(Ljava/lang/String;)V

    .line 18
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 13
    invoke-direct {p0, p1, p2}, Lcom/disney/id/android/volley/VolleyError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 14
    return-void
.end method


# virtual methods
.method public getResponse()Lcom/disney/id/android/guestcontroller/GuestControllerResponse;
    .locals 1

    .prologue
    .line 21
    iget-object v0, p0, Lcom/disney/id/android/guestcontroller/GuestControllerError;->guestControllerResponse:Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    return-object v0
.end method

.method setResponse(Lcom/disney/id/android/guestcontroller/GuestControllerResponse;)V
    .locals 0
    .param p1, "response"    # Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    .prologue
    .line 25
    iput-object p1, p0, Lcom/disney/id/android/guestcontroller/GuestControllerError;->guestControllerResponse:Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    .line 26
    return-void
.end method
