.class final Lcom/disney/id/android/guestcontroller/GuestController$8;
.super Ljava/lang/Object;
.source "GuestController.java"

# interfaces
.implements Lcom/disney/id/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/guestcontroller/GuestController;->refreshGuestData(Landroid/content/Context;Ljava/util/Map;Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$listener:Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;


# direct methods
.method constructor <init>(Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;)V
    .locals 0

    .prologue
    .line 190
    iput-object p1, p0, Lcom/disney/id/android/guestcontroller/GuestController$8;->val$listener:Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/disney/id/android/volley/VolleyError;)V
    .locals 1
    .param p1, "error"    # Lcom/disney/id/android/volley/VolleyError;

    .prologue
    .line 193
    iget-object v0, p0, Lcom/disney/id/android/guestcontroller/GuestController$8;->val$listener:Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;

    invoke-interface {v0, p1}, Lcom/disney/id/android/guestcontroller/GuestController$GuestControllerListener;->onErrorResponse(Lcom/disney/id/android/volley/VolleyError;)V

    .line 194
    return-void
.end method
