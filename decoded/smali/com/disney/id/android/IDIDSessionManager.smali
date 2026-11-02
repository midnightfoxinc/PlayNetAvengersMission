.class public interface abstract Lcom/disney/id/android/IDIDSessionManager;
.super Ljava/lang/Object;
.source "IDIDSessionManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disney/id/android/IDIDSessionManager$RequestFailure;,
        Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;,
        Lcom/disney/id/android/IDIDSessionManager$DIDSessionManagerDelegate;
    }
.end annotation


# virtual methods
.method public abstract forceTokenRefresh()V
.end method

.method public abstract getActivityStatus(Ljava/lang/String;Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;Lcom/disney/id/android/IDIDSessionManager$RequestFailure;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/disney/id/android/IDIDSessionManager$RequestSuccess",
            "<",
            "Lcom/disney/id/android/DIDActivityStatusResult;",
            ">;",
            "Lcom/disney/id/android/IDIDSessionManager$RequestFailure;",
            ")V"
        }
    .end annotation
.end method

.method public abstract loginWithBlueCookie(Ljava/lang/String;Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;Lcom/disney/id/android/IDIDSessionManager$RequestFailure;)V
    .param p2    # Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/disney/id/android/IDIDSessionManager$RequestSuccess",
            "<",
            "Lcom/disney/id/android/AdditionalAction;",
            ">;",
            "Lcom/disney/id/android/IDIDSessionManager$RequestFailure;",
            ")V"
        }
    .end annotation
.end method

.method public abstract logout()V
.end method

.method public abstract scheduleInitialRefreshForLoggedInGuest()V
.end method

.method public abstract setDelegate(Lcom/disney/id/android/IDIDSessionManager$DIDSessionManagerDelegate;)V
.end method
