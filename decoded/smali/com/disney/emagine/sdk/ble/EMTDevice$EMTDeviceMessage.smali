.class public Lcom/disney/emagine/sdk/ble/EMTDevice$EMTDeviceMessage;
.super Ljava/lang/Object;
.source "EMTDevice.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/emagine/sdk/ble/EMTDevice;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "EMTDeviceMessage"
.end annotation


# instance fields
.field public final device:Lcom/disney/emagine/sdk/ble/EMTDevice;

.field public final error:Lcom/disney/emagine/sdk/apple/NSError;

.field public final payload:[B


# direct methods
.method public constructor <init>(Lcom/disney/emagine/sdk/ble/EMTDevice;Lcom/disney/emagine/sdk/apple/NSError;[B)V
    .locals 0
    .param p1, "d"    # Lcom/disney/emagine/sdk/ble/EMTDevice;
    .param p2, "err"    # Lcom/disney/emagine/sdk/apple/NSError;
    .param p3, "pload"    # [B

    .prologue
    .line 2913
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2914
    iput-object p1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$EMTDeviceMessage;->device:Lcom/disney/emagine/sdk/ble/EMTDevice;

    .line 2915
    iput-object p2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$EMTDeviceMessage;->error:Lcom/disney/emagine/sdk/apple/NSError;

    .line 2916
    iput-object p3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$EMTDeviceMessage;->payload:[B

    .line 2917
    return-void
.end method
