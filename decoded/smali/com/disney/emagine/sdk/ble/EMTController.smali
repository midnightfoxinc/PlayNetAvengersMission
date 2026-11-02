.class public Lcom/disney/emagine/sdk/ble/EMTController;
.super Ljava/lang/Object;
.source "EMTController.java"


# static fields
.field public static final MSG_DEVICE_DID_BECOME_READY:I = 0x4

.field public static final MSG_DEVICE_DID_CONNECT:I = 0x2

.field public static final MSG_DEVICE_DID_DISCONNECT:I = 0x9

.field public static final MSG_DEVICE_DID_EXPERIENCE_PROTOCOL_ERROR:I = 0x7

.field public static final MSG_DEVICE_FAILED_TO_CONNECT:I = 0x3

.field public static final MSG_DEVICE_FOUND:I = 0x8

.field public static final MSG_DEVICE_I_AM_HERE:I = 0x1

.field public static final MSG_DEVICE_LEFT:I = 0xa

.field public static final MSG_DEVICE_RECEIVED_BROADCAST_EVENT:I = 0x6

.field public static final MSG_DEVICE_REQUESTED_FILENAME:I = 0x5

.field private static final SCAN_LEFT_THRESHOLD:I = 0xa

.field private static final TAG:Ljava/lang/String;


# instance fields
.field public blacklistedDeviceId:J

.field public blacklistedPeripheral:Landroid/bluetooth/BluetoothDevice;

.field private final bleStateReceiver:Landroid/content/BroadcastReceiver;

.field private cachedDevices:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/disney/emagine/sdk/ble/EMTDevice;",
            ">;"
        }
    .end annotation
.end field

.field private currentDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;

.field private executorService:Ljava/util/concurrent/ExecutorService;

.field private final mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

.field private mBluetoothEnabled:Ljava/lang/Boolean;

.field private mBluetoothGatt:Landroid/bluetooth/BluetoothGatt;

.field private final mBluetoothGattCallback:Lcom/disney/emagine/sdk/ble/EMTGattCallback;

.field private final mBluetoothManager:Landroid/bluetooth/BluetoothManager;

.field private mConsole:Lcom/disney/emagine/sdk/EMTConsole;

.field private final mHandler:Landroid/os/Handler;

.field private final mLeScanCallback:Lcom/disney/emagine/sdk/ble/EMTScanCallback;

.field private mLeScanCallbackActive:Landroid/bluetooth/BluetoothAdapter$LeScanCallback;

.field private final mStartScanRunnable:Ljava/lang/Runnable;

.field private final mStopScanRunnable:Ljava/lang/Runnable;

.field private timer:Ljava/util/Timer;

.field private timerTask:Ljava/util/TimerTask;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 81
    const-class v0, Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/emagine/sdk/ble/EMTController;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 176
    invoke-direct {p0, v0, v0, v0}, Lcom/disney/emagine/sdk/ble/EMTController;-><init>(Landroid/os/Handler;Lcom/disney/emagine/sdk/ble/EMTGattCallback;Lcom/disney/emagine/sdk/ble/EMTScanCallback;)V

    .line 177
    return-void
.end method

.method public constructor <init>(Landroid/os/Handler;Lcom/disney/emagine/sdk/ble/EMTGattCallback;Lcom/disney/emagine/sdk/ble/EMTScanCallback;)V
    .locals 4
    .param p1, "handler"    # Landroid/os/Handler;
    .param p2, "gattCallback"    # Lcom/disney/emagine/sdk/ble/EMTGattCallback;
    .param p3, "scanCallback"    # Lcom/disney/emagine/sdk/ble/EMTScanCallback;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 147
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 106
    new-instance v0, Lcom/disney/emagine/sdk/ble/EMTController$1;

    invoke-direct {v0, p0}, Lcom/disney/emagine/sdk/ble/EMTController$1;-><init>(Lcom/disney/emagine/sdk/ble/EMTController;)V

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->bleStateReceiver:Landroid/content/BroadcastReceiver;

    .line 134
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    .line 241
    new-instance v0, Lcom/disney/emagine/sdk/ble/EMTController$2;

    invoke-direct {v0, p0}, Lcom/disney/emagine/sdk/ble/EMTController$2;-><init>(Lcom/disney/emagine/sdk/ble/EMTController;)V

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mStopScanRunnable:Ljava/lang/Runnable;

    .line 262
    new-instance v0, Lcom/disney/emagine/sdk/ble/EMTController$3;

    invoke-direct {v0, p0}, Lcom/disney/emagine/sdk/ble/EMTController$3;-><init>(Lcom/disney/emagine/sdk/ble/EMTController;)V

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mStartScanRunnable:Ljava/lang/Runnable;

    .line 149
    invoke-static {}, Lcom/disney/emagine/app/EmagineApplication;->app()Lcom/disney/emagine/app/EmagineApplication;

    move-result-object v0

    const-string v1, "bluetooth"

    invoke-virtual {v0, v1}, Lcom/disney/emagine/app/EmagineApplication;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothManager;

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mBluetoothManager:Landroid/bluetooth/BluetoothManager;

    .line 150
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mBluetoothManager:Landroid/bluetooth/BluetoothManager;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothManager;->getAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 151
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    if-nez v0, :cond_0

    .line 152
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Bluetooth is not supported on this device."

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 154
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->cachedDevices:Ljava/util/HashMap;

    .line 156
    if-nez p2, :cond_1

    new-instance p2, Lcom/disney/emagine/sdk/ble/EMTGattCallback;

    .end local p2    # "gattCallback":Lcom/disney/emagine/sdk/ble/EMTGattCallback;
    invoke-direct {p2}, Lcom/disney/emagine/sdk/ble/EMTGattCallback;-><init>()V

    :cond_1
    iput-object p2, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mBluetoothGattCallback:Lcom/disney/emagine/sdk/ble/EMTGattCallback;

    .line 157
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mBluetoothGattCallback:Lcom/disney/emagine/sdk/ble/EMTGattCallback;

    invoke-virtual {v0, p0}, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->setController(Lcom/disney/emagine/sdk/ble/EMTController;)V

    .line 159
    if-nez p3, :cond_2

    new-instance p3, Lcom/disney/emagine/sdk/ble/EMTScanCallback;

    .end local p3    # "scanCallback":Lcom/disney/emagine/sdk/ble/EMTScanCallback;
    invoke-direct {p3}, Lcom/disney/emagine/sdk/ble/EMTScanCallback;-><init>()V

    :cond_2
    iput-object p3, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mLeScanCallback:Lcom/disney/emagine/sdk/ble/EMTScanCallback;

    .line 160
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mLeScanCallback:Lcom/disney/emagine/sdk/ble/EMTScanCallback;

    invoke-virtual {v0, p0}, Lcom/disney/emagine/sdk/ble/EMTScanCallback;->setController(Lcom/disney/emagine/sdk/ble/EMTController;)V

    .line 161
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mLeScanCallbackActive:Landroid/bluetooth/BluetoothAdapter$LeScanCallback;

    .line 163
    invoke-static {}, Lcom/disney/emagine/app/EmagineApplication;->app()Lcom/disney/emagine/app/EmagineApplication;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTController;->bleStateReceiver:Landroid/content/BroadcastReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/app/EmagineApplication;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 165
    if-nez p1, :cond_3

    .line 166
    invoke-static {}, Lcom/disney/emagine/app/EmagineApplication;->app()Lcom/disney/emagine/app/EmagineApplication;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/emagine/app/EmagineApplication;->mainHandler()Landroid/os/Handler;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mHandler:Landroid/os/Handler;

    .line 173
    :goto_0
    return-void

    .line 168
    :cond_3
    iput-object p1, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mHandler:Landroid/os/Handler;

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/disney/emagine/sdk/ble/EMTController;)Lcom/disney/emagine/sdk/EMTConsole;
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/ble/EMTController;

    .prologue
    .line 64
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    return-object v0
.end method

.method static synthetic access$100(Lcom/disney/emagine/sdk/ble/EMTController;)Landroid/bluetooth/BluetoothAdapter$LeScanCallback;
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/ble/EMTController;

    .prologue
    .line 64
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mLeScanCallbackActive:Landroid/bluetooth/BluetoothAdapter$LeScanCallback;

    return-object v0
.end method

.method static synthetic access$102(Lcom/disney/emagine/sdk/ble/EMTController;Landroid/bluetooth/BluetoothAdapter$LeScanCallback;)Landroid/bluetooth/BluetoothAdapter$LeScanCallback;
    .locals 0
    .param p0, "x0"    # Lcom/disney/emagine/sdk/ble/EMTController;
    .param p1, "x1"    # Landroid/bluetooth/BluetoothAdapter$LeScanCallback;

    .prologue
    .line 64
    iput-object p1, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mLeScanCallbackActive:Landroid/bluetooth/BluetoothAdapter$LeScanCallback;

    return-object p1
.end method

.method static synthetic access$200(Lcom/disney/emagine/sdk/ble/EMTController;)Landroid/bluetooth/BluetoothAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/ble/EMTController;

    .prologue
    .line 64
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    return-object v0
.end method

.method static synthetic access$300(Lcom/disney/emagine/sdk/ble/EMTController;)Lcom/disney/emagine/sdk/ble/EMTScanCallback;
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/ble/EMTController;

    .prologue
    .line 64
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mLeScanCallback:Lcom/disney/emagine/sdk/ble/EMTScanCallback;

    return-object v0
.end method

.method static synthetic access$400(Lcom/disney/emagine/sdk/ble/EMTController;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/ble/EMTController;

    .prologue
    .line 64
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mStopScanRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$500(Lcom/disney/emagine/sdk/ble/EMTController;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/ble/EMTController;

    .prologue
    .line 64
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$600(Lcom/disney/emagine/sdk/ble/EMTController;)Landroid/bluetooth/BluetoothGatt;
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/ble/EMTController;

    .prologue
    .line 64
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mBluetoothGatt:Landroid/bluetooth/BluetoothGatt;

    return-object v0
.end method

.method static synthetic access$602(Lcom/disney/emagine/sdk/ble/EMTController;Landroid/bluetooth/BluetoothGatt;)Landroid/bluetooth/BluetoothGatt;
    .locals 0
    .param p0, "x0"    # Lcom/disney/emagine/sdk/ble/EMTController;
    .param p1, "x1"    # Landroid/bluetooth/BluetoothGatt;

    .prologue
    .line 64
    iput-object p1, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mBluetoothGatt:Landroid/bluetooth/BluetoothGatt;

    return-object p1
.end method

.method static synthetic access$700(Lcom/disney/emagine/sdk/ble/EMTController;)Lcom/disney/emagine/sdk/ble/EMTGattCallback;
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/ble/EMTController;

    .prologue
    .line 64
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mBluetoothGattCallback:Lcom/disney/emagine/sdk/ble/EMTGattCallback;

    return-object v0
.end method

.method static synthetic access$800(Lcom/disney/emagine/sdk/ble/EMTController;)Lcom/disney/emagine/sdk/ble/EMTDevice;
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/ble/EMTController;

    .prologue
    .line 64
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->currentDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;

    return-object v0
.end method

.method static synthetic access$802(Lcom/disney/emagine/sdk/ble/EMTController;Lcom/disney/emagine/sdk/ble/EMTDevice;)Lcom/disney/emagine/sdk/ble/EMTDevice;
    .locals 0
    .param p0, "x0"    # Lcom/disney/emagine/sdk/ble/EMTController;
    .param p1, "x1"    # Lcom/disney/emagine/sdk/ble/EMTDevice;

    .prologue
    .line 64
    iput-object p1, p0, Lcom/disney/emagine/sdk/ble/EMTController;->currentDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;

    return-object p1
.end method

.method static synthetic access$900()Ljava/lang/String;
    .locals 1

    .prologue
    .line 64
    sget-object v0, Lcom/disney/emagine/sdk/ble/EMTController;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private checkRadio()V
    .locals 2

    .prologue
    .line 708
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mBluetoothEnabled:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    .line 712
    invoke-static {}, Lcom/disney/emagine/sdk/ble/EMTController;->radioEnabled()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mBluetoothEnabled:Ljava/lang/Boolean;

    .line 714
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mBluetoothEnabled:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    .line 715
    invoke-static {}, Lcom/disney/emagine/app/EmagineApplication;->app()Lcom/disney/emagine/app/EmagineApplication;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/emagine/app/EmagineApplication;->mainHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/disney/emagine/sdk/ble/EMTController$7;

    invoke-direct {v1, p0}, Lcom/disney/emagine/sdk/ble/EMTController$7;-><init>(Lcom/disney/emagine/sdk/ble/EMTController;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 724
    :cond_0
    return-void
.end method

.method public static locationServiceEnabled()Z
    .locals 5

    .prologue
    .line 740
    invoke-static {}, Lcom/disney/emagine/app/EmagineApplication;->app()Lcom/disney/emagine/app/EmagineApplication;

    move-result-object v3

    const-string v4, "location"

    invoke-virtual {v3, v4}, Lcom/disney/emagine/app/EmagineApplication;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/location/LocationManager;

    .line 741
    .local v1, "lm":Landroid/location/LocationManager;
    const/4 v0, 0x0

    .line 742
    .local v0, "gps_enabled":Z
    const/4 v2, 0x0

    .line 745
    .local v2, "network_enabled":Z
    :try_start_0
    const-string v3, "gps"

    invoke-virtual {v1, v3}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v0

    .line 749
    :goto_0
    :try_start_1
    const-string v3, "network"

    invoke-virtual {v1, v3}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result v2

    .line 752
    :goto_1
    if-nez v0, :cond_0

    if-eqz v2, :cond_1

    :cond_0
    const/4 v3, 0x1

    :goto_2
    return v3

    :cond_1
    const/4 v3, 0x0

    goto :goto_2

    .line 750
    :catch_0
    move-exception v3

    goto :goto_1

    .line 746
    :catch_1
    move-exception v3

    goto :goto_0
.end method

.method public static radioEnabled()Z
    .locals 4

    .prologue
    .line 728
    invoke-static {}, Lcom/disney/emagine/app/EmagineApplication;->app()Lcom/disney/emagine/app/EmagineApplication;

    move-result-object v2

    const-string v3, "bluetooth"

    invoke-virtual {v2, v3}, Lcom/disney/emagine/app/EmagineApplication;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/bluetooth/BluetoothManager;

    .line 729
    .local v1, "bluetoothManager":Landroid/bluetooth/BluetoothManager;
    invoke-virtual {v1}, Landroid/bluetooth/BluetoothManager;->getAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    .line 731
    .local v0, "bluetoothAdapter":Landroid/bluetooth/BluetoothAdapter;
    if-nez v0, :cond_0

    .line 732
    const/4 v2, 0x0

    .line 735
    :goto_0
    return v2

    :cond_0
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v2

    goto :goto_0
.end method


# virtual methods
.method public declared-synchronized addToDeviceCache(Lcom/disney/emagine/sdk/ble/EMTDevice;)V
    .locals 2
    .param p1, "device"    # Lcom/disney/emagine/sdk/ble/EMTDevice;

    .prologue
    .line 196
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->cachedDevices:Ljava/util/HashMap;

    invoke-virtual {p1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->peripheral()Landroid/bluetooth/BluetoothDevice;

    move-result-object v1

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 197
    monitor-exit p0

    return-void

    .line 196
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public beginScanning()V
    .locals 4

    .prologue
    .line 295
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "GATT"

    const-string v2, "beginScanning() called."

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 297
    invoke-direct {p0}, Lcom/disney/emagine/sdk/ble/EMTController;->checkRadio()V

    .line 298
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/ble/EMTController;->isScanning()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 300
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "GATT"

    const-string v2, "BLE Scanning already in progress. Ignoring duplicate call."

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 309
    :goto_0
    return-void

    .line 305
    :cond_0
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mStopScanRunnable:Ljava/lang/Runnable;

    const-wide/32 v2, 0xea60

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 307
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mStartScanRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public blacklistDevice(J)V
    .locals 1
    .param p1, "deviceId"    # J

    .prologue
    .line 643
    iput-wide p1, p0, Lcom/disney/emagine/sdk/ble/EMTController;->blacklistedDeviceId:J

    .line 644
    return-void
.end method

.method public clearKnownDevices()V
    .locals 1

    .prologue
    .line 226
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->cachedDevices:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 227
    return-void
.end method

.method public closeDevice()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 455
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mBluetoothGatt:Landroid/bluetooth/BluetoothGatt;

    if-nez v0, :cond_0

    .line 456
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "EMTController"

    const-string v2, "device is closed.  Did you call open()?"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 503
    :goto_0
    return-void

    .line 460
    :cond_0
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mBluetoothGattCallback:Lcom/disney/emagine/sdk/ble/EMTGattCallback;

    iget-boolean v0, v0, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->isConnected:Z

    if-eqz v0, :cond_1

    .line 461
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "EMTController"

    const-string v2, "a device is already connected.  Did you call disconnect() and wait for deviceDidDisconnectWithError() to be called?"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 465
    :cond_1
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/disney/emagine/sdk/ble/EMTController$6;

    invoke-direct {v1, p0}, Lcom/disney/emagine/sdk/ble/EMTController$6;-><init>(Lcom/disney/emagine/sdk/ble/EMTController;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public connect()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 377
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/ble/EMTController;->isBLEEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 379
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Bluetooth is not enabled. Did you enable it using ACTION_REQUEST_ENABLE"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 382
    :cond_0
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mBluetoothGattCallback:Lcom/disney/emagine/sdk/ble/EMTGattCallback;

    iget-boolean v0, v0, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->isConnected:Z

    if-eqz v0, :cond_1

    .line 402
    :goto_0
    return-void

    .line 388
    :cond_1
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mBluetoothGattCallback:Lcom/disney/emagine/sdk/ble/EMTGattCallback;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->isConnected:Z

    .line 390
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/disney/emagine/sdk/ble/EMTController$4;

    invoke-direct {v1, p0}, Lcom/disney/emagine/sdk/ble/EMTController$4;-><init>(Lcom/disney/emagine/sdk/ble/EMTController;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;
    .locals 1

    .prologue
    .line 506
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->currentDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;

    return-object v0
.end method

.method deviceDidBecomeReady()V
    .locals 4

    .prologue
    .line 638
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x4

    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTController;->currentDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-virtual {v1, v2, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 639
    return-void
.end method

.method public deviceDidConnect()V
    .locals 4

    .prologue
    .line 530
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTController;->currentDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->didConnectDevice(Lcom/disney/emagine/sdk/ble/EMTDevice;)V

    .line 531
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTController;->currentDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-virtual {v1, v2, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 532
    return-void
.end method

.method public deviceDidDisconnectWithError(Lcom/disney/emagine/sdk/apple/NSError;)V
    .locals 3
    .param p1, "error"    # Lcom/disney/emagine/sdk/apple/NSError;

    .prologue
    .line 583
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "EMTController"

    const-string v2, "deviceDidDisconnectWithError"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 586
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->currentDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->cancelAndInvalidate()V

    .line 587
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->cachedDevices:Ljava/util/HashMap;

    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTController;->currentDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-virtual {v1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->peripheral()Landroid/bluetooth/BluetoothDevice;

    move-result-object v1

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 588
    return-void
.end method

.method public deviceDidDiscoverCharacteristicsForService(Landroid/bluetooth/BluetoothGattService;)V
    .locals 8
    .param p1, "service"    # Landroid/bluetooth/BluetoothGattService;

    .prologue
    .line 760
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGattService;->getCharacteristics()Ljava/util/List;

    move-result-object v1

    .line 762
    .local v1, "characteristics":Ljava/util/List;, "Ljava/util/List<Landroid/bluetooth/BluetoothGattCharacteristic;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothGattCharacteristic;

    .line 764
    .local v0, "characteristic":Landroid/bluetooth/BluetoothGattCharacteristic;
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v2

    .line 766
    .local v2, "uuid":Ljava/util/UUID;
    const-string v4, "0643e701-b573-46e0-a878-06c78140b0db"

    invoke-static {v4}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 768
    iget-object v4, p0, Lcom/disney/emagine/sdk/ble/EMTController;->currentDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;

    iput-object v0, v4, Lcom/disney/emagine/sdk/ble/EMTDevice;->mNotifyCharacteristic:Landroid/bluetooth/BluetoothGattCharacteristic;

    .line 770
    iget-object v4, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mBluetoothGatt:Landroid/bluetooth/BluetoothGatt;

    iget-object v5, p0, Lcom/disney/emagine/sdk/ble/EMTController;->currentDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;

    iget-object v5, v5, Lcom/disney/emagine/sdk/ble/EMTDevice;->mNotifyCharacteristic:Landroid/bluetooth/BluetoothGattCharacteristic;

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6}, Landroid/bluetooth/BluetoothGatt;->setCharacteristicNotification(Landroid/bluetooth/BluetoothGattCharacteristic;Z)Z

    .line 772
    new-instance v4, Lcom/disney/emagine/sdk/ble/EMTController$8;

    invoke-direct {v4, p0}, Lcom/disney/emagine/sdk/ble/EMTController$8;-><init>(Lcom/disney/emagine/sdk/ble/EMTController;)V

    const-wide/16 v6, 0x1f4

    invoke-virtual {p0, v4, v6, v7}, Lcom/disney/emagine/sdk/ble/EMTController;->postDelayed(Ljava/lang/Runnable;J)V

    goto :goto_0

    .line 799
    :cond_1
    const-string v4, "0643e702-b573-46e0-a878-06c78140b0db"

    invoke-static {v4}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 801
    iget-object v4, p0, Lcom/disney/emagine/sdk/ble/EMTController;->currentDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;

    iput-object v0, v4, Lcom/disney/emagine/sdk/ble/EMTDevice;->mWriteCharacteristic:Landroid/bluetooth/BluetoothGattCharacteristic;

    goto :goto_0

    .line 806
    .end local v0    # "characteristic":Landroid/bluetooth/BluetoothGattCharacteristic;
    .end local v2    # "uuid":Ljava/util/UUID;
    :cond_2
    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTController;->currentDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-virtual {v3}, Lcom/disney/emagine/sdk/ble/EMTDevice;->readyCheck()V

    .line 807
    return-void
.end method

.method public deviceDidFailToConnectWithError(Lcom/disney/emagine/sdk/ble/EMTDevice;)V
    .locals 4
    .param p1, "device"    # Lcom/disney/emagine/sdk/ble/EMTDevice;

    .prologue
    .line 542
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x3

    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTController;->currentDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-virtual {v1, v2, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 543
    return-void
.end method

.method public deviceDidReceiveImHere(Lcom/disney/emagine/sdk/ble/EMTDevice;[B)V
    .locals 3
    .param p1, "device"    # Lcom/disney/emagine/sdk/ble/EMTDevice;
    .param p2, "payload"    # [B

    .prologue
    .line 519
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->deviceDidReceiveBroadcastEvent(Lcom/disney/emagine/sdk/ble/EMTDevice;[B)V

    .line 520
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x1

    invoke-virtual {v1, v2, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 521
    return-void
.end method

.method public declared-synchronized deviceForPeripheral(Landroid/bluetooth/BluetoothDevice;)Lcom/disney/emagine/sdk/ble/EMTDevice;
    .locals 2
    .param p1, "peripheral"    # Landroid/bluetooth/BluetoothDevice;

    .prologue
    .line 187
    monitor-enter p0

    if-eqz p1, :cond_0

    .line 189
    :try_start_0
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->cachedDevices:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disney/emagine/sdk/ble/EMTDevice;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 191
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 187
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public deviceIsReadyForApplication()V
    .locals 2

    .prologue
    .line 551
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTController;->currentDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->deviceIsReadyForApplication(Lcom/disney/emagine/sdk/ble/EMTDevice;)V

    .line 552
    return-void
.end method

.method public deviceRequestedFileTransfer(Lcom/disney/emagine/sdk/ble/EMTDevice;Ljava/lang/String;)V
    .locals 6
    .param p1, "device"    # Lcom/disney/emagine/sdk/ble/EMTDevice;
    .param p2, "filename"    # Ljava/lang/String;

    .prologue
    .line 556
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x5

    invoke-virtual {v1, v2, p2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 557
    const/4 v0, 0x1

    new-instance v1, Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;

    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v2

    iget-wide v4, p1, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    invoke-direct {v1, v2, p2, v4, v5}, Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;-><init>(Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;Ljava/lang/String;J)V

    invoke-virtual {p1, v0, v1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->acceptFile(ZLcom/disney/emagine/sdk/delegate/EMTAcceptCompletionDelegate;)V

    .line 558
    return-void
.end method

.method public disconnectDevice()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 424
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mBluetoothGatt:Landroid/bluetooth/BluetoothGatt;

    if-nez v0, :cond_1

    .line 449
    :cond_0
    :goto_0
    return-void

    .line 429
    :cond_1
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mBluetoothGattCallback:Lcom/disney/emagine/sdk/ble/EMTGattCallback;

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mBluetoothGattCallback:Lcom/disney/emagine/sdk/ble/EMTGattCallback;

    iget-boolean v0, v0, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->isConnected:Z

    if-eqz v0, :cond_0

    .line 434
    :cond_2
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->currentDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;

    if-eqz v0, :cond_0

    .line 439
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->currentDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendCloseBLEConnection()V

    .line 442
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/disney/emagine/sdk/ble/EMTController$5;

    invoke-direct {v1, p0}, Lcom/disney/emagine/sdk/ble/EMTController$5;-><init>(Lcom/disney/emagine/sdk/ble/EMTController;)V

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method

.method public isBLEEnabled()Z
    .locals 1

    .prologue
    .line 235
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v0

    return v0
.end method

.method public isConnected()Z
    .locals 2

    .prologue
    .line 411
    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mBluetoothGatt:Landroid/bluetooth/BluetoothGatt;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mBluetoothGattCallback:Lcom/disney/emagine/sdk/ble/EMTGattCallback;

    iget-boolean v1, v1, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->isConnected:Z

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    .line 414
    .local v0, "result":Z
    :goto_0
    return v0

    .line 411
    .end local v0    # "result":Z
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isNotifyCharacterisitic(Landroid/bluetooth/BluetoothGattCharacteristic;)Z
    .locals 1
    .param p1, "characteristic"    # Landroid/bluetooth/BluetoothGattCharacteristic;

    .prologue
    .line 208
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGattCharacteristic;->getProperties()I

    move-result v0

    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isScanning()Z
    .locals 1

    .prologue
    .line 287
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mLeScanCallbackActive:Landroid/bluetooth/BluetoothAdapter$LeScanCallback;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public knownDevices()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lcom/disney/emagine/sdk/ble/EMTDevice;",
            ">;"
        }
    .end annotation

    .prologue
    .line 218
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->cachedDevices:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public onCharacteristicChanged(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V
    .locals 1
    .param p1, "gatt"    # Landroid/bluetooth/BluetoothGatt;
    .param p2, "characteristic"    # Landroid/bluetooth/BluetoothGattCharacteristic;

    .prologue
    .line 617
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/ble/EMTController;->validateCurrentDevice(Landroid/bluetooth/BluetoothDevice;)V

    .line 618
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->currentDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-virtual {v0, p1, p2}, Lcom/disney/emagine/sdk/ble/EMTDevice;->onCharacteristicChanged(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V

    .line 619
    return-void
.end method

.method public onCharacteristicWrite(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;I)V
    .locals 1
    .param p1, "gatt"    # Landroid/bluetooth/BluetoothGatt;
    .param p2, "characteristic"    # Landroid/bluetooth/BluetoothGattCharacteristic;
    .param p3, "status"    # I

    .prologue
    .line 622
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->currentDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-virtual {v0, p1, p2, p3}, Lcom/disney/emagine/sdk/ble/EMTDevice;->onCharacteristicWrite(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;I)V

    .line 623
    return-void
.end method

.method onDeviceRssi(I)V
    .locals 1
    .param p1, "rssi"    # I

    .prologue
    .line 609
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->currentDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->onDeviceRssi(I)V

    .line 610
    return-void
.end method

.method public onReadRemoteRssi(Z)V
    .locals 1
    .param p1, "success"    # Z

    .prologue
    .line 613
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->currentDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->onReadRemoteRssi(Z)V

    .line 614
    return-void
.end method

.method public onServicesDiscovered(Landroid/bluetooth/BluetoothGatt;I)V
    .locals 5
    .param p1, "gatt"    # Landroid/bluetooth/BluetoothGatt;
    .param p2, "status"    # I

    .prologue
    .line 592
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/disney/emagine/sdk/ble/EMTController;->validateCurrentDevice(Landroid/bluetooth/BluetoothDevice;)V

    .line 594
    if-nez p2, :cond_1

    .line 596
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mBluetoothGatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothGatt;->getServices()Ljava/util/List;

    move-result-object v1

    .line 598
    .local v1, "services":Ljava/util/List;, "Ljava/util/List<Landroid/bluetooth/BluetoothGattService;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothGattService;

    .line 600
    .local v0, "service":Landroid/bluetooth/BluetoothGattService;
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGattService;->getUuid()Ljava/util/UUID;

    move-result-object v3

    const-string v4, "0643e700-b573-46e0-a878-06c78140b0db"

    invoke-static {v4}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 602
    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/ble/EMTController;->deviceDidDiscoverCharacteristicsForService(Landroid/bluetooth/BluetoothGattService;)V

    goto :goto_0

    .line 606
    .end local v0    # "service":Landroid/bluetooth/BluetoothGattService;
    .end local v1    # "services":Ljava/util/List;, "Ljava/util/List<Landroid/bluetooth/BluetoothGattService;>;"
    :cond_1
    return-void
.end method

.method public onTick(Ljava/util/Timer;)V
    .locals 14
    .param p1, "timer"    # Ljava/util/Timer;

    .prologue
    .line 864
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    .line 867
    .local v5, "removeDevices":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/disney/emagine/sdk/ble/EMTDevice;>;"
    :try_start_0
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/ble/EMTController;->knownDevices()Ljava/util/Collection;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_0
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/disney/emagine/sdk/ble/EMTDevice;

    .line 869
    .local v1, "device":Lcom/disney/emagine/sdk/ble/EMTDevice;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    iget-wide v12, v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->lastTimeMsgReceived:J

    sub-long/2addr v10, v12

    long-to-int v7, v10

    .line 871
    .local v7, "timeInterval":I
    const/16 v9, 0x2710

    if-le v7, v9, :cond_0

    .line 873
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 874
    .local v2, "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v9, "device_id"

    iget-wide v10, v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    long-to-int v10, v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v2, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 875
    const-string v9, "type"

    iget v10, v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceType:I

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v2, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 876
    invoke-static {v2}, Lcom/disney/emagine/sdk/json/EMTJson;->bytesFromJavaObject(Ljava/lang/Object;)[B

    move-result-object v0

    .line 878
    .local v0, "data":[B
    if-eqz v0, :cond_1

    .line 880
    invoke-static {v0}, Lcom/disney/emagine/sdk/EMTFileManager;->utf8StringFromBytes([B)Ljava/lang/String;

    move-result-object v4

    .line 882
    .local v4, "jsonString":Ljava/lang/String;
    if-eqz v4, :cond_1

    .line 884
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v9

    const/16 v10, 0x9

    invoke-virtual {v9, v10, v4}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    .line 888
    .end local v4    # "jsonString":Ljava/lang/String;
    :cond_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 889
    .local v6, "sb":Ljava/lang/StringBuilder;
    const-string v9, " BLE_DEVICE_LEFT "

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 890
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 891
    const-string v9, " "

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 892
    const-string v9, " device_id="

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 893
    iget-wide v10, v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    invoke-virtual {v6, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 894
    const-string v9, " deviceType="

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 895
    iget v9, v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceType:I

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 896
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v9

    const-string v10, "EMTController"

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 898
    invoke-interface {v5, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 902
    .end local v0    # "data":[B
    .end local v1    # "device":Lcom/disney/emagine/sdk/ble/EMTDevice;
    .end local v2    # "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v6    # "sb":Ljava/lang/StringBuilder;
    .end local v7    # "timeInterval":I
    :catch_0
    move-exception v3

    .line 904
    .local v3, "e":Ljava/lang/Exception;
    iget-object v8, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v9, Lcom/disney/emagine/sdk/ble/EMTController;->TAG:Ljava/lang/String;

    const-string v10, "OnTick Exception"

    invoke-virtual {v8, v9, v10}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    .line 905
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    .line 908
    .end local v3    # "e":Ljava/lang/Exception;
    :cond_2
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/ble/EMTController;->knownDevices()Ljava/util/Collection;

    move-result-object v8

    invoke-interface {v8, v5}, Ljava/util/Collection;->removeAll(Ljava/util/Collection;)Z

    .line 909
    return-void
.end method

.method public openDevice(Lcom/disney/emagine/sdk/ble/EMTDevice;)V
    .locals 4
    .param p1, "device"    # Lcom/disney/emagine/sdk/ble/EMTDevice;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 337
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/ble/EMTController;->isBLEEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 339
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "GATT"

    const-string v2, "EMTController.openDevice BLE not enabled. Throwing IOException"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 340
    invoke-static {}, Ljava/lang/Thread;->dumpStack()V

    .line 341
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Bluetooth is not enabled. Did you enable it using ACTION_REQUEST_ENABLE"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 344
    :cond_0
    if-nez p1, :cond_1

    .line 345
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "GATT"

    const-string v2, "EMTController.openDevice EMTDevice is null. throwing IOException."

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 346
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "device cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 349
    :cond_1
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->cachedDevices:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 350
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "GATT"

    const-string v2, "EMTController.openDevice EMTDevice is not cached. throwing IllegalArgumentException"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 351
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "the specified device was not found during a scan."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 354
    :cond_2
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mBluetoothGatt:Landroid/bluetooth/BluetoothGatt;

    if-eqz v0, :cond_3

    .line 355
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "GATT"

    const-string v2, "EMTController.openDevice EMTDevice is not closed. returning."

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 364
    :goto_0
    return-void

    .line 360
    :cond_3
    iput-object p1, p0, Lcom/disney/emagine/sdk/ble/EMTController;->currentDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;

    .line 361
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->currentDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;

    iput-object p0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->controller:Lcom/disney/emagine/sdk/ble/EMTController;

    .line 362
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->currentDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->lastTimeMsgReceived:J

    goto :goto_0
.end method

.method public postDelayed(Ljava/lang/Runnable;J)V
    .locals 2
    .param p1, "r"    # Ljava/lang/Runnable;
    .param p2, "milliseconds"    # J

    .prologue
    .line 568
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, p1, p2, p3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 569
    return-void
.end method

.method postToHandler(ILcom/disney/emagine/sdk/ble/EMTDevice$EMTDeviceMessage;)V
    .locals 2
    .param p1, "message"    # I
    .param p2, "obj"    # Lcom/disney/emagine/sdk/ble/EMTDevice$EMTDeviceMessage;

    .prologue
    .line 572
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, p1, p2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 573
    return-void
.end method

.method postToHandler(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 563
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 564
    return-void
.end method

.method public declared-synchronized removeFromDeviceCache(Lcom/disney/emagine/sdk/ble/EMTDevice;)V
    .locals 2
    .param p1, "device"    # Lcom/disney/emagine/sdk/ble/EMTDevice;

    .prologue
    .line 200
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->cachedDevices:Ljava/util/HashMap;

    invoke-virtual {p1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->peripheral()Landroid/bluetooth/BluetoothDevice;

    move-result-object v1

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 201
    monitor-exit p0

    return-void

    .line 200
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public sendUpdateFirmware()V
    .locals 1

    .prologue
    .line 510
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->currentDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendUpdateFirmware()V

    .line 511
    return-void
.end method

.method public startTimer(I)V
    .locals 8
    .param p1, "seconds"    # I

    .prologue
    .line 817
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->timer:Ljava/util/Timer;

    .line 818
    new-instance v0, Lcom/disney/emagine/sdk/ble/EMTController$9;

    invoke-direct {v0, p0}, Lcom/disney/emagine/sdk/ble/EMTController$9;-><init>(Lcom/disney/emagine/sdk/ble/EMTController;)V

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->timerTask:Ljava/util/TimerTask;

    .line 835
    const/4 v6, 0x0

    .line 836
    .local v6, "delay":I
    move v7, p1

    .line 838
    .local v7, "interval":I
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->timer:Ljava/util/Timer;

    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTController;->timerTask:Ljava/util/TimerTask;

    int-to-long v2, v6

    mul-int/lit16 v4, v7, 0x3e8

    int-to-long v4, v4

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->scheduleAtFixedRate(Ljava/util/TimerTask;JJ)V

    .line 839
    return-void
.end method

.method public stopScanning()V
    .locals 3

    .prologue
    .line 316
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    const-string v1, "GATT"

    const-string v2, "stopScanning() called."

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 318
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/ble/EMTController;->isScanning()Z

    move-result v0

    if-nez v0, :cond_0

    .line 319
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    const-string v1, "GATT"

    const-string v2, "isScanning = true, so exiting"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 329
    :goto_0
    return-void

    .line 324
    :cond_0
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mStopScanRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 327
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mStopScanRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public stopTimer()V
    .locals 1

    .prologue
    .line 848
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->timerTask:Ljava/util/TimerTask;

    if-eqz v0, :cond_0

    .line 849
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->timerTask:Ljava/util/TimerTask;

    invoke-virtual {v0}, Ljava/util/TimerTask;->cancel()Z

    .line 851
    :cond_0
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->timer:Ljava/util/Timer;

    if-eqz v0, :cond_1

    .line 852
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->timer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 853
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->timer:Ljava/util/Timer;

    .line 855
    :cond_1
    return-void
.end method

.method public validateCurrentDevice(Landroid/bluetooth/BluetoothDevice;)V
    .locals 2
    .param p1, "bDev"    # Landroid/bluetooth/BluetoothDevice;

    .prologue
    .line 632
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->currentDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->peripheral()Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    if-eq p1, v0, :cond_0

    .line 633
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "bluetooth device and EMTController device mismatch."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 635
    :cond_0
    return-void
.end method

.method public whitelistDevice()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 648
    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTController;->blacklistedPeripheral:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {p0, v1}, Lcom/disney/emagine/sdk/ble/EMTController;->deviceForPeripheral(Landroid/bluetooth/BluetoothDevice;)Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 650
    .local v0, "device":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v0, :cond_0

    .line 652
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->deviceDidBecomeAvailable(Lcom/disney/emagine/sdk/ble/EMTDevice;)V

    .line 653
    const/16 v1, 0x8

    new-instance v2, Lcom/disney/emagine/sdk/ble/EMTDevice$EMTDeviceMessage;

    invoke-direct {v2, v0, v4, v4}, Lcom/disney/emagine/sdk/ble/EMTDevice$EMTDeviceMessage;-><init>(Lcom/disney/emagine/sdk/ble/EMTDevice;Lcom/disney/emagine/sdk/apple/NSError;[B)V

    invoke-virtual {p0, v1, v2}, Lcom/disney/emagine/sdk/ble/EMTController;->postToHandler(ILcom/disney/emagine/sdk/ble/EMTDevice$EMTDeviceMessage;)V

    .line 656
    :cond_0
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/disney/emagine/sdk/ble/EMTController;->blacklistedDeviceId:J

    .line 657
    iput-object v4, p0, Lcom/disney/emagine/sdk/ble/EMTController;->blacklistedPeripheral:Landroid/bluetooth/BluetoothDevice;

    .line 658
    return-void
.end method

.method writePacket(Landroid/bluetooth/BluetoothGattCharacteristic;)V
    .locals 2
    .param p1, "characteristic"    # Landroid/bluetooth/BluetoothGattCharacteristic;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 687
    invoke-direct {p0}, Lcom/disney/emagine/sdk/ble/EMTController;->checkRadio()V

    .line 690
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mBluetoothGattCallback:Lcom/disney/emagine/sdk/ble/EMTGattCallback;

    iget-boolean v0, v0, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->isConnected:Z

    if-nez v0, :cond_0

    .line 691
    new-instance v0, Ljava/io/IOException;

    const-string v1, "not connected to device"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 694
    :cond_0
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mBluetoothGatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v0, p1}, Landroid/bluetooth/BluetoothGatt;->writeCharacteristic(Landroid/bluetooth/BluetoothGattCharacteristic;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 695
    new-instance v0, Ljava/io/IOException;

    const-string v1, "write failed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 699
    :cond_1
    return-void
.end method

.method writePacket([BLandroid/bluetooth/BluetoothGattCharacteristic;I)V
    .locals 2
    .param p1, "packet"    # [B
    .param p2, "characteristic"    # Landroid/bluetooth/BluetoothGattCharacteristic;
    .param p3, "writeType"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 672
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController;->mBluetoothGattCallback:Lcom/disney/emagine/sdk/ble/EMTGattCallback;

    iget-boolean v0, v0, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->isConnected:Z

    if-nez v0, :cond_0

    .line 673
    new-instance v0, Ljava/io/IOException;

    const-string v1, "not connected to device"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 676
    :cond_0
    invoke-virtual {p2, p1}, Landroid/bluetooth/BluetoothGattCharacteristic;->setValue([B)Z

    move-result v0

    if-nez v0, :cond_1

    .line 677
    new-instance v0, Ljava/io/IOException;

    const-string v1, "characteristic.setValue(packet) failed."

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 679
    :cond_1
    invoke-virtual {p2, p3}, Landroid/bluetooth/BluetoothGattCharacteristic;->setWriteType(I)V

    .line 680
    invoke-virtual {p0, p2}, Lcom/disney/emagine/sdk/ble/EMTController;->writePacket(Landroid/bluetooth/BluetoothGattCharacteristic;)V

    .line 682
    return-void
.end method
