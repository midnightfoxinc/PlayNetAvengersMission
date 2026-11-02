.class public interface abstract Lcom/disney/id/android/DIDSessionDelegate;
.super Ljava/lang/Object;
.source "DIDSessionDelegate.java"


# virtual methods
.method public abstract onClose()V
.end method

.method public abstract onCreate()V
.end method

.method public abstract onError(Lcom/disney/id/android/DIDException;)V
.end method

.method public abstract onForceTokenRefreshFailure(Lcom/disney/id/android/DIDException;)V
.end method

.method public abstract onForceTokenRefreshSuccess()V
.end method

.method public abstract onLogin()V
.end method

.method public abstract onLoginBlueFailure(Lcom/disney/id/android/DIDException;)V
.end method

.method public abstract onLoginBlueSuccess()V
.end method

.method public abstract onLogout()V
.end method

.method public abstract onLowTrust()V
.end method

.method public abstract onOptIn(Ljava/lang/String;)V
.end method

.method public abstract onReauth()V
.end method

.method public abstract onRefresh()V
.end method

.method public abstract onRefreshGuestDataFailure(Lcom/disney/id/android/DIDException;)V
.end method

.method public abstract onRefreshGuestDataSuccess()V
.end method

.method public abstract onUpdate(Ljava/lang/String;)V
.end method
