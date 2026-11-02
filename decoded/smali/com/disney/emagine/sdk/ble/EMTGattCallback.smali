.class public Lcom/disney/emagine/sdk/ble/EMTGattCallback;
.super Landroid/bluetooth/BluetoothGattCallback;
.source "EMTGattCallback.java"


# instance fields
.field private final TAG:Ljava/lang/String;

.field isConnected:Z

.field private final mConnectLock:Ljava/lang/Object;

.field private mConsole:Lcom/disney/emagine/sdk/EMTConsole;

.field private mController:Lcom/disney/emagine/sdk/ble/EMTController;

.field private final mDisconnectLock:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 35
    invoke-direct {p0}, Landroid/bluetooth/BluetoothGattCallback;-><init>()V

    .line 27
    const-string v0, "EMTGattCallback"

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->TAG:Ljava/lang/String;

    .line 28
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->isConnected:Z

    .line 30
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->mDisconnectLock:Ljava/lang/Object;

    .line 31
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->mConnectLock:Ljava/lang/Object;

    .line 32
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    .line 36
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    const-string v1, "GATT"

    const-string v2, "EMTGattCallback instance."

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    return-void
.end method

.method static synthetic access$000(Lcom/disney/emagine/sdk/ble/EMTGattCallback;)Lcom/disney/emagine/sdk/ble/EMTController;
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/ble/EMTGattCallback;

    .prologue
    .line 20
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->mController:Lcom/disney/emagine/sdk/ble/EMTController;

    return-object v0
.end method

.method static synthetic access$100(Lcom/disney/emagine/sdk/ble/EMTGattCallback;)Lcom/disney/emagine/sdk/EMTConsole;
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/ble/EMTGattCallback;

    .prologue
    .line 20
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    return-object v0
.end method

.method static synthetic access$200(Lcom/disney/emagine/sdk/ble/EMTGattCallback;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/ble/EMTGattCallback;

    .prologue
    .line 20
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->mDisconnectLock:Ljava/lang/Object;

    return-object v0
.end method


# virtual methods
.method public isConnected()Z
    .locals 1

    .prologue
    .line 98
    iget-boolean v0, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->isConnected:Z

    return v0
.end method

.method public onCharacteristicChanged(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V
    .locals 1
    .param p1, "gatt"    # Landroid/bluetooth/BluetoothGatt;
    .param p2, "characteristic"    # Landroid/bluetooth/BluetoothGattCharacteristic;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->mController:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-virtual {v0, p1, p2}, Lcom/disney/emagine/sdk/ble/EMTController;->onCharacteristicChanged(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V

    .line 49
    return-void
.end method

.method public onCharacteristicWrite(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;I)V
    .locals 1
    .param p1, "gatt"    # Landroid/bluetooth/BluetoothGatt;
    .param p2, "characteristic"    # Landroid/bluetooth/BluetoothGattCharacteristic;
    .param p3, "status"    # I

    .prologue
    .line 53
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->mController:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-virtual {v0, p1, p2, p3}, Lcom/disney/emagine/sdk/ble/EMTController;->onCharacteristicWrite(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;I)V

    .line 54
    return-void
.end method

.method public onConnectionStateChange(Landroid/bluetooth/BluetoothGatt;II)V
    .locals 2
    .param p1, "gatt"    # Landroid/bluetooth/BluetoothGatt;
    .param p2, "status"    # I
    .param p3, "newState"    # I

    .prologue
    .line 58
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->mController:Lcom/disney/emagine/sdk/ble/EMTController;

    new-instance v1, Lcom/disney/emagine/sdk/ble/EMTGattCallback$1;

    invoke-direct {v1, p0, p1, p3, p2}, Lcom/disney/emagine/sdk/ble/EMTGattCallback$1;-><init>(Lcom/disney/emagine/sdk/ble/EMTGattCallback;Landroid/bluetooth/BluetoothGatt;II)V

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/ble/EMTController;->postToHandler(Ljava/lang/Runnable;)V

    .line 95
    return-void
.end method

.method public onReadRemoteRssi(Landroid/bluetooth/BluetoothGatt;II)V
    .locals 2
    .param p1, "gatt"    # Landroid/bluetooth/BluetoothGatt;
    .param p2, "rssi"    # I
    .param p3, "status"    # I

    .prologue
    .line 109
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->mController:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/ble/EMTController;->validateCurrentDevice(Landroid/bluetooth/BluetoothDevice;)V

    .line 110
    if-nez p3, :cond_0

    .line 111
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->mController:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-virtual {v0, p2}, Lcom/disney/emagine/sdk/ble/EMTController;->onDeviceRssi(I)V

    .line 113
    :cond_0
    return-void
.end method

.method public onServicesDiscovered(Landroid/bluetooth/BluetoothGatt;I)V
    .locals 2
    .param p1, "gatt"    # Landroid/bluetooth/BluetoothGatt;
    .param p2, "status"    # I

    .prologue
    .line 103
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->mController:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/ble/EMTController;->validateCurrentDevice(Landroid/bluetooth/BluetoothDevice;)V

    .line 104
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->mController:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-virtual {v0, p1, p2}, Lcom/disney/emagine/sdk/ble/EMTController;->onServicesDiscovered(Landroid/bluetooth/BluetoothGatt;I)V

    .line 105
    return-void
.end method

.method setController(Lcom/disney/emagine/sdk/ble/EMTController;)V
    .locals 0
    .param p1, "controller"    # Lcom/disney/emagine/sdk/ble/EMTController;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->mController:Lcom/disney/emagine/sdk/ble/EMTController;

    .line 41
    return-void
.end method
