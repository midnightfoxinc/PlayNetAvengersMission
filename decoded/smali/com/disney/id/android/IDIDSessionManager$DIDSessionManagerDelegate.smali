.class public interface abstract Lcom/disney/id/android/IDIDSessionManager$DIDSessionManagerDelegate;
.super Ljava/lang/Object;
.source "IDIDSessionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/id/android/IDIDSessionManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "DIDSessionManagerDelegate"
.end annotation


# virtual methods
.method public abstract onTokenRefreshFailure(Lcom/disney/id/android/DIDSessionManagerFailure;)V
.end method

.method public abstract onTokenRefreshSuccess(Lcom/disney/id/android/AdditionalAction;)V
.end method
