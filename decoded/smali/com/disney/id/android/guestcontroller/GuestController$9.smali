.class final Lcom/disney/id/android/guestcontroller/GuestController$9;
.super Ljava/lang/Object;
.source "GuestController.java"

# interfaces
.implements Lcom/disney/id/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/guestcontroller/GuestController;->updateGuest(Landroid/content/Context;Ljava/util/Map;Lorg/json/JSONObject;Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/disney/id/android/volley/Response$Listener",
        "<",
        "Lcom/disney/id/android/guestcontroller/GuestControllerResponse;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$listener:Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;


# direct methods
.method constructor <init>(Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;)V
    .locals 0

    .prologue
    .line 231
    iput-object p1, p0, Lcom/disney/id/android/guestcontroller/GuestController$9;->val$listener:Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onResponse(Lcom/disney/id/android/guestcontroller/GuestControllerResponse;)V
    .locals 1
    .param p1, "response"    # Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    .prologue
    .line 234
    iget-object v0, p0, Lcom/disney/id/android/guestcontroller/GuestController$9;->val$listener:Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;

    invoke-interface {v0, p1}, Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;->onResponse(Lcom/disney/id/android/guestcontroller/GuestControllerResponse;)V

    .line 235
    return-void
.end method

.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 231
    check-cast p1, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/disney/id/android/guestcontroller/GuestController$9;->onResponse(Lcom/disney/id/android/guestcontroller/GuestControllerResponse;)V

    return-void
.end method
