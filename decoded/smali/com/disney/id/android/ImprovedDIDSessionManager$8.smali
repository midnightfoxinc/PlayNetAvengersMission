.class final Lcom/disney/id/android/ImprovedDIDSessionManager$8;
.super Ljava/lang/Object;
.source "ImprovedDIDSessionManager.java"

# interfaces
.implements Lcom/disney/id/android/IDIDSessionManager$DIDSessionManagerDelegate;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/id/android/ImprovedDIDSessionManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# static fields
.field private static final DELEGATE_REGISTRATION_ADVISORY_MESSAGE:Ljava/lang/String; = " If you want to receive DIDSessionManager updates, register as the delegate."


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 480
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTokenRefreshFailure(Lcom/disney/id/android/DIDSessionManagerFailure;)V
    .locals 2
    .param p1, "failure"    # Lcom/disney/id/android/DIDSessionManagerFailure;

    .prologue
    .line 490
    invoke-static {}, Lcom/disney/id/android/ImprovedDIDSessionManager;->access$900()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "onTokenRefreshFailure would have been called. If you want to receive DIDSessionManager updates, register as the delegate."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 491
    return-void
.end method

.method public onTokenRefreshSuccess(Lcom/disney/id/android/AdditionalAction;)V
    .locals 2
    .param p1, "additionalAction"    # Lcom/disney/id/android/AdditionalAction;

    .prologue
    .line 485
    invoke-static {}, Lcom/disney/id/android/ImprovedDIDSessionManager;->access$900()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "onTokenRefreshSuccess would have been called. If you want to receive DIDSessionManager updates, register as the delegate."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 486
    return-void
.end method
