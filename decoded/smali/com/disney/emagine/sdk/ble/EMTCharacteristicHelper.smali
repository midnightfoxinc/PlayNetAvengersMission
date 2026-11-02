.class public Lcom/disney/emagine/sdk/ble/EMTCharacteristicHelper;
.super Ljava/lang/Object;
.source "EMTCharacteristicHelper.java"


# instance fields
.field private characteristic:Landroid/bluetooth/BluetoothGattCharacteristic;

.field private propertiesFlag:I


# direct methods
.method public constructor <init>(Landroid/bluetooth/BluetoothGattCharacteristic;)V
    .locals 1
    .param p1, "characteristic"    # Landroid/bluetooth/BluetoothGattCharacteristic;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    const/4 v0, 0x0

    iput v0, p0, Lcom/disney/emagine/sdk/ble/EMTCharacteristicHelper;->propertiesFlag:I

    .line 22
    iput-object p1, p0, Lcom/disney/emagine/sdk/ble/EMTCharacteristicHelper;->characteristic:Landroid/bluetooth/BluetoothGattCharacteristic;

    .line 23
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGattCharacteristic;->getProperties()I

    move-result v0

    iput v0, p0, Lcom/disney/emagine/sdk/ble/EMTCharacteristicHelper;->propertiesFlag:I

    .line 24
    return-void
.end method

.method private isBitSet(I)Z
    .locals 1
    .param p1, "bit"    # I

    .prologue
    .line 28
    iget v0, p0, Lcom/disney/emagine/sdk/ble/EMTCharacteristicHelper;->propertiesFlag:I

    and-int/2addr v0, p1

    if-ne v0, p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public isNotify()Z
    .locals 1

    .prologue
    .line 38
    const/16 v0, 0x10

    invoke-direct {p0, v0}, Lcom/disney/emagine/sdk/ble/EMTCharacteristicHelper;->isBitSet(I)Z

    move-result v0

    return v0
.end method

.method public isRead()Z
    .locals 1

    .prologue
    .line 33
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/disney/emagine/sdk/ble/EMTCharacteristicHelper;->isBitSet(I)Z

    move-result v0

    return v0
.end method

.method public isWrite()Z
    .locals 1

    .prologue
    .line 43
    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lcom/disney/emagine/sdk/ble/EMTCharacteristicHelper;->isBitSet(I)Z

    move-result v0

    return v0
.end method

.method public isWriteNoResponse()Z
    .locals 1

    .prologue
    .line 48
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lcom/disney/emagine/sdk/ble/EMTCharacteristicHelper;->isBitSet(I)Z

    move-result v0

    return v0
.end method
