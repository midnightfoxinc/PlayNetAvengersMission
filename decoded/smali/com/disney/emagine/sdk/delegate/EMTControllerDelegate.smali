.class public interface abstract Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;
.super Ljava/lang/Object;
.source "EMTControllerDelegate.java"


# virtual methods
.method public abstract TAG()Ljava/lang/String;
.end method

.method public abstract console()Lcom/disney/emagine/sdk/EMTConsole;
.end method

.method public abstract deviceDidBecomeAvailable(Lcom/disney/emagine/sdk/ble/EMTDevice;)V
.end method

.method public abstract deviceDidDisconnectWithError(Lcom/disney/emagine/sdk/ble/EMTDevice;Lcom/disney/emagine/sdk/apple/NSError;)V
.end method

.method public abstract deviceDidExperienceProtocolError(Lcom/disney/emagine/sdk/ble/EMTDevice;Lcom/disney/emagine/sdk/apple/NSError;)V
.end method

.method public abstract deviceDidFailToConnectWithError(Lcom/disney/emagine/sdk/ble/EMTDevice;Lcom/disney/emagine/sdk/apple/NSError;)V
.end method

.method public abstract deviceDidReceiveBroadcastEvent(Lcom/disney/emagine/sdk/ble/EMTDevice;[B)V
.end method

.method public abstract deviceDidReceiveComplexPayload(Lcom/disney/emagine/sdk/ble/EMTDevice;[B)V
.end method

.method public abstract handleAnalyticsFile(Ljava/lang/String;J[B)V
.end method

.method public abstract handlePackagesPresentFile(Ljava/lang/String;Ljava/lang/String;[B)V
.end method

.method public abstract handlePlayerDataFile(Ljava/lang/String;Ljava/lang/String;[B)V
.end method

.method public abstract isAnalyticsFile(Ljava/lang/String;)Z
.end method

.method public abstract isPackagesPresentFile(Ljava/lang/String;)Z
.end method

.method public abstract isPlayerDataFile(Ljava/lang/String;)Z
.end method
