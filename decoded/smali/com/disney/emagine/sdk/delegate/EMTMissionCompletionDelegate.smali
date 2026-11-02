.class public interface abstract Lcom/disney/emagine/sdk/delegate/EMTMissionCompletionDelegate;
.super Ljava/lang/Object;
.source "EMTMissionCompletionDelegate.java"


# virtual methods
.method public abstract TAG()Ljava/lang/String;
.end method

.method public abstract addLineToConsole(Ljava/lang/String;)V
.end method

.method public abstract console()Lcom/disney/emagine/sdk/EMTConsole;
.end method

.method public abstract currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;
.end method

.method public abstract packageTransferComplete(ILjava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract setError(Lcom/disney/emagine/sdk/apple/NSError;)V
.end method

.method public abstract setStartTime(J)V
.end method

.method public abstract setTransferredBytes(J)V
.end method

.method public abstract showErrorWithTitle(Lcom/disney/emagine/sdk/apple/NSError;Ljava/lang/String;)V
.end method
