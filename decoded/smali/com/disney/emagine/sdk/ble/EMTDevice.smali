.class public Lcom/disney/emagine/sdk/ble/EMTDevice;
.super Ljava/lang/Object;
.source "EMTDevice.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disney/emagine/sdk/ble/EMTDevice$EMTDeviceMessage;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final COMPRESSED:B = 0x2t

.field public static final FILE_TRANSFER_ACCEPT_SIZE:B = 0xet

.field public static final MAX_NUMBER_MESSAGE_RETRIES:B = 0x5t

.field public static final MAX_RETRIES_ON_NACK:B = 0x3t

.field public static final MAX_RETRIES_ON_TIMEOUT:B = 0x3t

.field public static final MESSAGE_PROTOCOL_VERSION:B = 0x0t

.field public static final OVERWRITE_EXISTING:B = 0x4t

.field private static final PacketMTUSize:I = 0x400

.field public static final RADIO_BLE_ADDRESS:I = 0xfffe

.field public static final RADIO_BROADCAST_ADDRESS:I = 0xffff

.field public static final RADIO_INVALID_ADDRESS:I = 0x0

.field public static final RADIO_PAN_COORD_ADDRESS:I = 0x1

.field public static final RESET:B = 0x8t

.field private static final TAG:Ljava/lang/String;

.field public static final VALIDATE_CRC32:B = 0x1t

.field private static final packetDelay:I = 0x2134


# instance fields
.field private EMAGINE_WRITEMODE:I

.field private NONCE_SIZE:B

.field public RSSI:J

.field private ackRetryCounter:B

.field private ackTimer:Ljava/util/Timer;

.field private ackTimerTask:Ljava/util/TimerTask;

.field private appSessionNonce:[B

.field private calculatedNonce:[B

.field controller:Lcom/disney/emagine/sdk/ble/EMTController;

.field private currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

.field public deviceFlags:B

.field private deviceIDToRadioID:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public deviceId:J

.field public deviceName:Ljava/lang/String;

.field public deviceType:I

.field public fileTransferAllowed:Z

.field private frameCounter:I

.field public imHereFlags:S

.field private incomingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

.field private keyStore:Lcom/disney/emagine/sdk/keystore/EMTKeyStore;

.field private lastReadyCheck:Z

.field public lastTimeMsgReceived:J

.field private loopbackOperation:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private mConsole:Lcom/disney/emagine/sdk/EMTConsole;

.field private mCrypto:Lcom/disney/emagine/sdk/crypto/EMTCrypto;

.field private mDevice:Landroid/bluetooth/BluetoothDevice;

.field mNotifyCharacteristic:Landroid/bluetooth/BluetoothGattCharacteristic;

.field mWriteCharacteristic:Landroid/bluetooth/BluetoothGattCharacteristic;

.field public nonceEstablished:Z

.field private notifySubscribed:Z

.field private outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

.field private packetInFlight:Z

.field private packetsToWrite:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<[B>;"
        }
    .end annotation
.end field

.field private pendingOperations:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private readyCompletions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private receiveFrameCounter:I

.field private retryCount:I

.field private stopDraining:Z

.field private toySessionNonce:[B

.field private transferPending:Z

.field private transmitPacketSequenceNumber:I

.field private waitingForACK:Z

.field private watchDogDebug:Z

.field private watchDogTimer:Ljava/util/Timer;

.field private watchDogTimerTask:Ljava/util/TimerTask;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 60
    const-class v0, Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->$assertionsDisabled:Z

    .line 62
    const-class v0, Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    return-void

    .line 60
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Landroid/bluetooth/BluetoothDevice;)V
    .locals 3
    .param p1, "device"    # Landroid/bluetooth/BluetoothDevice;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "UseSparseArrays"
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 209
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    const/4 v0, 0x1

    iput v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->EMAGINE_WRITEMODE:I

    .line 95
    iput-boolean v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->notifySubscribed:Z

    .line 96
    iput-boolean v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->waitingForACK:Z

    .line 97
    iput-boolean v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->packetInFlight:Z

    .line 98
    iput-boolean v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->stopDraining:Z

    .line 99
    iput-boolean v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->lastReadyCheck:Z

    .line 100
    iput-boolean v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->transferPending:Z

    .line 101
    iput-boolean v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->watchDogDebug:Z

    .line 122
    iput v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->transmitPacketSequenceNumber:I

    .line 124
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    .line 175
    iput-short v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->imHereFlags:S

    .line 180
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->lastTimeMsgReceived:J

    .line 182
    iput v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->receiveFrameCounter:I

    .line 183
    iput v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->frameCounter:I

    .line 184
    iput v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->retryCount:I

    .line 186
    iput-byte v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->ackRetryCounter:B

    .line 187
    const/4 v0, 0x5

    iput-byte v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->NONCE_SIZE:B

    .line 210
    iput-object p1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    .line 212
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->readyCompletions:Ljava/util/ArrayList;

    .line 213
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->pendingOperations:Ljava/util/ArrayList;

    .line 214
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->packetsToWrite:Ljava/util/ArrayList;

    .line 215
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceIDToRadioID:Ljava/util/HashMap;

    .line 216
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->loopbackOperation:Ljava/util/HashMap;

    .line 217
    invoke-static {}, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->sharedInstance()Lcom/disney/emagine/sdk/keystore/EMTKeyStore;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->keyStore:Lcom/disney/emagine/sdk/keystore/EMTKeyStore;

    .line 218
    new-instance v0, Lcom/disney/emagine/sdk/crypto/EMTCrypto;

    invoke-direct {v0}, Lcom/disney/emagine/sdk/crypto/EMTCrypto;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mCrypto:Lcom/disney/emagine/sdk/crypto/EMTCrypto;

    .line 220
    iput v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->receiveFrameCounter:I

    .line 221
    iput-boolean v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->nonceEstablished:Z

    .line 223
    return-void
.end method

.method static synthetic access$000(Lcom/disney/emagine/sdk/ble/EMTDevice;)[B
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/ble/EMTDevice;

    .prologue
    .line 60
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->toySessionNonce:[B

    return-object v0
.end method

.method static synthetic access$100(Lcom/disney/emagine/sdk/ble/EMTDevice;)[B
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/ble/EMTDevice;

    .prologue
    .line 60
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->appSessionNonce:[B

    return-object v0
.end method

.method static synthetic access$1000(Lcom/disney/emagine/sdk/ble/EMTDevice;)Lcom/disney/emagine/sdk/crypto/EMTCrypto;
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/ble/EMTDevice;

    .prologue
    .line 60
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mCrypto:Lcom/disney/emagine/sdk/crypto/EMTCrypto;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/disney/emagine/sdk/ble/EMTDevice;)Lcom/disney/emagine/sdk/keystore/EMTKeyStore;
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/ble/EMTDevice;

    .prologue
    .line 60
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->keyStore:Lcom/disney/emagine/sdk/keystore/EMTKeyStore;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/disney/emagine/sdk/ble/EMTDevice;Lcom/disney/emagine/sdk/EMTMessage;)Z
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/ble/EMTDevice;
    .param p1, "x1"    # Lcom/disney/emagine/sdk/EMTMessage;

    .prologue
    .line 60
    invoke-direct {p0, p1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->fragmentAndEnqueue(Lcom/disney/emagine/sdk/EMTMessage;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1300(Lcom/disney/emagine/sdk/ble/EMTDevice;)Z
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/ble/EMTDevice;

    .prologue
    .line 60
    invoke-direct {p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->drainPacketQueue()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1400(Lcom/disney/emagine/sdk/ble/EMTDevice;Lcom/disney/emagine/sdk/EMTMessage;)V
    .locals 0
    .param p0, "x0"    # Lcom/disney/emagine/sdk/ble/EMTDevice;
    .param p1, "x1"    # Lcom/disney/emagine/sdk/EMTMessage;

    .prologue
    .line 60
    invoke-direct {p0, p1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->parseAndHandleMessage(Lcom/disney/emagine/sdk/EMTMessage;)V

    return-void
.end method

.method static synthetic access$202(Lcom/disney/emagine/sdk/ble/EMTDevice;[B)[B
    .locals 0
    .param p0, "x0"    # Lcom/disney/emagine/sdk/ble/EMTDevice;
    .param p1, "x1"    # [B

    .prologue
    .line 60
    iput-object p1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->calculatedNonce:[B

    return-object p1
.end method

.method static synthetic access$300(Lcom/disney/emagine/sdk/ble/EMTDevice;)B
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/ble/EMTDevice;

    .prologue
    .line 60
    iget-byte v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->NONCE_SIZE:B

    return v0
.end method

.method static synthetic access$400(Lcom/disney/emagine/sdk/ble/EMTDevice;)V
    .locals 0
    .param p0, "x0"    # Lcom/disney/emagine/sdk/ble/EMTDevice;

    .prologue
    .line 60
    invoke-direct {p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->resendMessage()V

    return-void
.end method

.method static synthetic access$500(Lcom/disney/emagine/sdk/ble/EMTDevice;)V
    .locals 0
    .param p0, "x0"    # Lcom/disney/emagine/sdk/ble/EMTDevice;

    .prologue
    .line 60
    invoke-direct {p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->watchDogTimeout()V

    return-void
.end method

.method static synthetic access$600(Lcom/disney/emagine/sdk/ble/EMTDevice;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/ble/EMTDevice;

    .prologue
    .line 60
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->pendingOperations:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$700(Lcom/disney/emagine/sdk/ble/EMTDevice;SLjava/util/HashMap;)[B
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/ble/EMTDevice;
    .param p1, "x1"    # S
    .param p2, "x2"    # Ljava/util/HashMap;

    .prologue
    .line 60
    invoke-direct {p0, p1, p2}, Lcom/disney/emagine/sdk/ble/EMTDevice;->dataForOperation(SLjava/util/HashMap;)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$800()Ljava/lang/String;
    .locals 1

    .prologue
    .line 60
    sget-object v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$900(Lcom/disney/emagine/sdk/ble/EMTDevice;)Lcom/disney/emagine/sdk/EMTConsole;
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/ble/EMTDevice;

    .prologue
    .line 60
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    return-object v0
.end method

.method private createMessageForDevice(JI)Lcom/disney/emagine/sdk/EMTMessage;
    .locals 3
    .param p1, "deviceId"    # J
    .param p3, "opcode"    # I

    .prologue
    .line 559
    invoke-static {}, Lcom/disney/emagine/sdk/keystore/EMTKeyStrategy;->sharedInstance()Lcom/disney/emagine/sdk/keystore/EMTKeyStrategy;

    move-result-object v1

    invoke-virtual {v1, p3}, Lcom/disney/emagine/sdk/keystore/EMTKeyStrategy;->requiredKey(I)B

    move-result v0

    .line 561
    .local v0, "keySlot":B
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->createMessageForDevice(JIB)Lcom/disney/emagine/sdk/EMTMessage;

    move-result-object v1

    return-object v1
.end method

.method private createMessageForDevice(JIB)Lcom/disney/emagine/sdk/EMTMessage;
    .locals 7
    .param p1, "deviceId"    # J
    .param p3, "opcode"    # I
    .param p4, "keySlot"    # B

    .prologue
    .line 566
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Create message "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " for device id "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 567
    new-instance v0, Lcom/disney/emagine/sdk/EMTMessage;

    invoke-direct {v0}, Lcom/disney/emagine/sdk/EMTMessage;-><init>()V

    .line 569
    .local v0, "message":Lcom/disney/emagine/sdk/EMTMessage;
    invoke-direct {p0, p1, p2}, Lcom/disney/emagine/sdk/ble/EMTDevice;->radioIDFromDeviceID(J)J

    move-result-wide v2

    long-to-int v1, v2

    .line 570
    .local v1, "targetRadioAddress":I
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "device_id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", radio address="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 572
    if-nez v1, :cond_0

    .line 574
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v4, "target radio address is 0. returning null message."

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 576
    const/4 v0, 0x0

    .line 587
    .end local v0    # "message":Lcom/disney/emagine/sdk/EMTMessage;
    :goto_0
    return-object v0

    .line 579
    .restart local v0    # "message":Lcom/disney/emagine/sdk/EMTMessage;
    :cond_0
    if-nez v1, :cond_1

    .line 580
    new-instance v2, Ljava/lang/UnsupportedOperationException;

    const-string v3, "A target radio address of RADIO_INVALID_ADDRESS was found. message for this address not supported."

    invoke-direct {v2, v3}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 583
    :cond_1
    iput-byte p4, v0, Lcom/disney/emagine/sdk/EMTMessage;->keySlot:B

    .line 584
    iput v1, v0, Lcom/disney/emagine/sdk/EMTMessage;->targetAddress:I

    .line 585
    const v2, 0xfffe

    iput v2, v0, Lcom/disney/emagine/sdk/EMTMessage;->senderAddress:I

    goto :goto_0
.end method

.method private createMessageForOutgoing(ZI)Lcom/disney/emagine/sdk/EMTMessage;
    .locals 4
    .param p1, "outgoing"    # Z
    .param p2, "opcode"    # I

    .prologue
    .line 598
    const-wide/16 v0, 0x0

    .line 600
    .local v0, "deviceId":J
    if-eqz p1, :cond_0

    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    if-eqz v2, :cond_0

    .line 602
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-wide v0, v2, Lcom/disney/emagine/sdk/EMTFileTransfer;->deviceId:J

    .line 611
    :goto_0
    invoke-direct {p0, v0, v1, p2}, Lcom/disney/emagine/sdk/ble/EMTDevice;->createMessageForDevice(JI)Lcom/disney/emagine/sdk/EMTMessage;

    move-result-object v2

    return-object v2

    .line 604
    :cond_0
    if-nez p1, :cond_1

    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->incomingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    if-eqz v2, :cond_1

    .line 606
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->incomingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-wide v0, v2, Lcom/disney/emagine/sdk/EMTFileTransfer;->deviceId:J

    goto :goto_0

    .line 608
    :cond_1
    const-wide/16 v2, 0x1

    invoke-virtual {p0, v2, v3}, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceIDFromRadioID(J)J

    move-result-wide v0

    goto :goto_0
.end method

.method private dataForOperation(SLjava/util/HashMap;)[B
    .locals 26
    .param p1, "opcode"    # S
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(S",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)[B"
        }
    .end annotation

    .prologue
    .line 1601
    .local p2, "parameters":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static/range {p1 .. p1}, Lcom/disney/emagine/sdk/EMTData;->shortToBytes(S)[B

    move-result-object v20

    invoke-static/range {v20 .. v20}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v17

    .line 1605
    .local v17, "result":[B
    sparse-switch p1, :sswitch_data_0

    .line 1744
    :goto_0
    return-object v17

    .line 1610
    :sswitch_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v20, v0

    sget-object v21, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "SEND ---> PING - opcode("

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, ")"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v20 .. v22}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1612
    const-string v20, "payload"

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, [B

    check-cast v20, [B

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v17

    .line 1613
    goto :goto_0

    .line 1619
    :sswitch_1
    const-string v20, "crc32"

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/Long;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    .line 1620
    .local v4, "crc32":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v20, v0

    sget-object v21, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "SEND ---> FILE_TRANSFER_START - CRC = "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-static {v4, v5}, Lcom/disney/emagine/sdk/EMTData;->longToBytes(J)[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/disney/emagine/sdk/EMTData;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v20 .. v22}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1621
    const-string v20, "length"

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/Long;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Long;->intValue()I

    move-result v13

    .line 1623
    .local v13, "length":I
    invoke-static {v4, v5}, Lcom/disney/emagine/sdk/EMTData;->longToIntBytes(J)[B

    move-result-object v20

    invoke-static/range {v20 .. v20}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v20

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v17

    .line 1624
    invoke-static {v13}, Lcom/disney/emagine/sdk/EMTData;->intToBytes(I)[B

    move-result-object v20

    invoke-static/range {v20 .. v20}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v20

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v17

    .line 1626
    const-string v20, "filename"

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 1627
    .local v11, "filename":Ljava/lang/String;
    invoke-static {v11}, Lcom/disney/emagine/sdk/EMTData;->stringToASCIIBytes(Ljava/lang/String;)[B

    move-result-object v9

    .line 1629
    .local v9, "fileName":[B
    array-length v0, v9

    move/from16 v20, v0

    move/from16 v0, v20

    int-to-short v0, v0

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lcom/disney/emagine/sdk/EMTData;->shortToBytes(S)[B

    move-result-object v20

    invoke-static/range {v20 .. v20}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v20

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v17

    .line 1631
    const-string v20, "version"

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    .line 1632
    .local v10, "fileVersion":Ljava/lang/Integer;
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v20

    invoke-static/range {v20 .. v20}, Lcom/disney/emagine/sdk/EMTData;->intToBytes(I)[B

    move-result-object v20

    invoke-static/range {v20 .. v20}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v20

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v17

    .line 1634
    sget-boolean v20, Lcom/disney/emagine/sdk/ble/EMTDevice;->$assertionsDisabled:Z

    if-nez v20, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v20, v0

    if-nez v20, :cond_0

    new-instance v20, Ljava/lang/AssertionError;

    invoke-direct/range {v20 .. v20}, Ljava/lang/AssertionError;-><init>()V

    throw v20

    .line 1636
    :cond_0
    monitor-enter p0

    .line 1638
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-byte v0, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->flags:B

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lcom/disney/emagine/sdk/EMTData;->byteToBytes(B)[B

    move-result-object v20

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v17

    .line 1639
    move-object/from16 v0, v17

    invoke-static {v0, v9}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v17

    .line 1641
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v20, v0

    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v21, v0

    add-int/lit8 v21, v21, 0x2

    move/from16 v0, v21

    int-to-long v0, v0

    move-wide/from16 v22, v0

    move-wide/from16 v0, v22

    move-object/from16 v2, v20

    iput-wide v0, v2, Lcom/disney/emagine/sdk/EMTFileTransfer;->headerLength:J

    .line 1642
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1643
    invoke-virtual/range {p0 .. p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->setWatchDogTimer()V

    goto/16 :goto_0

    .line 1642
    :catchall_0
    move-exception v20

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v20

    .line 1650
    .end local v4    # "crc32":J
    .end local v9    # "fileName":[B
    .end local v10    # "fileVersion":Ljava/lang/Integer;
    .end local v11    # "filename":Ljava/lang/String;
    .end local v13    # "length":I
    :sswitch_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v20, v0

    sget-object v21, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "SEND ---> FILE_TRANSFER_ACCEPT - opcode("

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, ")"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v20 .. v22}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1652
    const-string v20, "status"

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/Integer;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v18

    .line 1654
    .local v18, "status":I
    invoke-static/range {v18 .. v18}, Lcom/disney/emagine/sdk/EMTData;->intToShortBytes(I)[B

    move-result-object v20

    invoke-static/range {v20 .. v20}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v20

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v17

    .line 1656
    const-string v20, "packetMTU"

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/Integer;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v14

    .line 1658
    .local v14, "maxMessage":I
    int-to-short v0, v14

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lcom/disney/emagine/sdk/EMTData;->shortToBytes(S)[B

    move-result-object v20

    invoke-static/range {v20 .. v20}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v20

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v17

    .line 1661
    const/16 v19, 0x0

    .line 1663
    .local v19, "zero":I
    invoke-static/range {v19 .. v19}, Lcom/disney/emagine/sdk/EMTData;->intToBytes(I)[B

    move-result-object v20

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v17

    .line 1664
    invoke-static/range {v19 .. v19}, Lcom/disney/emagine/sdk/EMTData;->intToBytes(I)[B

    move-result-object v20

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v17

    .line 1666
    goto/16 :goto_0

    .line 1671
    .end local v14    # "maxMessage":I
    .end local v18    # "status":I
    .end local v19    # "zero":I
    :sswitch_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v20, v0

    sget-object v21, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "SEND ---> FILE_TRANSFER_RESET - opcode("

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, ")"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v20 .. v22}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1673
    const-string v20, "offset"

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/Long;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Long;->intValue()I

    move-result v16

    .line 1675
    .local v16, "offset":I
    invoke-static/range {v16 .. v16}, Lcom/disney/emagine/sdk/EMTData;->intToBytes(I)[B

    move-result-object v20

    invoke-static/range {v20 .. v20}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v20

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v17

    .line 1677
    goto/16 :goto_0

    .line 1682
    .end local v16    # "offset":I
    :sswitch_4
    const-string v20, "offset"

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/Long;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Long;->intValue()I

    move-result v16

    .line 1683
    .restart local v16    # "offset":I
    const-string v20, "flag"

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/Short;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Short;->byteValue()B

    move-result v12

    .line 1685
    .local v12, "flag":B
    invoke-static/range {v16 .. v16}, Lcom/disney/emagine/sdk/EMTData;->intToBytes(I)[B

    move-result-object v20

    invoke-static/range {v20 .. v20}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v20

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v17

    .line 1686
    invoke-static {v12}, Lcom/disney/emagine/sdk/EMTData;->byteToBytes(B)[B

    move-result-object v20

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v17

    .line 1688
    const-string v20, "data"

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, [B

    move-object/from16 v8, v20

    check-cast v8, [B

    .line 1689
    .local v8, "fileData":[B
    array-length v0, v8

    move/from16 v20, v0

    move/from16 v0, v20

    int-to-short v7, v0

    .line 1691
    .local v7, "dataLength":S
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v20, v0

    sget-object v21, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v22, "SEND ---> FILETRANSFER_DATA(%d, %d, %d)"

    const/16 v23, 0x3

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x1

    invoke-static {v7}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x2

    invoke-static {v12}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v25

    aput-object v25, v23, v24

    invoke-static/range {v22 .. v23}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v20 .. v22}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1693
    invoke-static {v7}, Lcom/disney/emagine/sdk/EMTData;->shortToBytes(S)[B

    move-result-object v20

    invoke-static/range {v20 .. v20}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v20

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v17

    .line 1694
    move-object/from16 v0, v17

    invoke-static {v0, v8}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v17

    .line 1696
    goto/16 :goto_0

    .line 1701
    .end local v7    # "dataLength":S
    .end local v8    # "fileData":[B
    .end local v12    # "flag":B
    .end local v16    # "offset":I
    :sswitch_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v20, v0

    sget-object v21, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "SEND ---> FILE_TRANSFER_ACK - opcode("

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, ")"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v20 .. v22}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1704
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v20, v0

    sget-object v21, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v22, "Success: CRC\'s match"

    invoke-virtual/range {v20 .. v22}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1706
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->transferPending:Z

    goto/16 :goto_0

    .line 1713
    :sswitch_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v20, v0

    sget-object v21, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "SEND ---> FILE_TRANSFER_NACK - opcode("

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, ")"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v20 .. v22}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1716
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v20, v0

    sget-object v21, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v22, "ERROR: Failed to transfer due to CRC of file not matching"

    invoke-virtual/range {v20 .. v22}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1718
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->transferPending:Z

    goto/16 :goto_0

    .line 1725
    :sswitch_7
    const-string v20, "contents"

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, [B

    move-object/from16 v6, v20

    check-cast v6, [B

    .line 1727
    .local v6, "data":[B
    move-object/from16 v17, v6

    .line 1729
    goto/16 :goto_0

    .line 1734
    .end local v6    # "data":[B
    :sswitch_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v20, v0

    sget-object v21, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v22, "SEND ---> NONCE_RESPONSE"

    invoke-virtual/range {v20 .. v22}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1736
    const-string v20, "nonce"

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, [B

    move-object/from16 v15, v20

    check-cast v15, [B

    .line 1738
    .local v15, "nonce":[B
    move-object/from16 v0, v17

    invoke-static {v0, v15}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v17

    .line 1740
    goto/16 :goto_0

    .line 1605
    :sswitch_data_0
    .sparse-switch
        0x3fff -> :sswitch_1
        0x4000 -> :sswitch_2
        0x4001 -> :sswitch_3
        0x4002 -> :sswitch_4
        0x4003 -> :sswitch_5
        0x4004 -> :sswitch_6
        0x4005 -> :sswitch_0
        0x4006 -> :sswitch_0
        0x400d -> :sswitch_8
        0xfffd -> :sswitch_7
    .end sparse-switch
.end method

.method private deviceDidExperienceProtocolError(Lcom/disney/emagine/sdk/apple/NSError;)V
    .locals 4
    .param p1, "error"    # Lcom/disney/emagine/sdk/apple/NSError;

    .prologue
    .line 2616
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->controller:Lcom/disney/emagine/sdk/ble/EMTController;

    const/4 v1, 0x7

    new-instance v2, Lcom/disney/emagine/sdk/ble/EMTDevice$EMTDeviceMessage;

    const/4 v3, 0x0

    invoke-direct {v2, p0, p1, v3}, Lcom/disney/emagine/sdk/ble/EMTDevice$EMTDeviceMessage;-><init>(Lcom/disney/emagine/sdk/ble/EMTDevice;Lcom/disney/emagine/sdk/apple/NSError;[B)V

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/ble/EMTController;->postToHandler(ILcom/disney/emagine/sdk/ble/EMTDevice$EMTDeviceMessage;)V

    .line 2617
    return-void
.end method

.method private declared-synchronized drainPacketQueue()Z
    .locals 8

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 2572
    monitor-enter p0

    const/4 v4, 0x0

    :try_start_0
    iput-boolean v4, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->stopDraining:Z

    .line 2574
    iget-object v4, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->packetsToWrite:Ljava/util/ArrayList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-nez v4, :cond_0

    .line 2607
    :goto_0
    monitor-exit p0

    return v2

    .line 2578
    :cond_0
    :try_start_1
    iget-object v4, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->packetsToWrite:Ljava/util/ArrayList;

    monitor-enter v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 2580
    :try_start_2
    iget-object v5, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->packetsToWrite:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_2

    .line 2583
    iget-boolean v5, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->packetInFlight:Z

    if-nez v5, :cond_2

    .line 2585
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->packetInFlight:Z

    .line 2587
    iget-object v5, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->packetsToWrite:Ljava/util/ArrayList;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    .line 2590
    .local v1, "nextPacket":[B
    if-nez v1, :cond_1

    .line 2591
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "nextPacket should never be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 2604
    .end local v1    # "nextPacket":[B
    :catchall_0
    move-exception v2

    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 2572
    :catchall_1
    move-exception v2

    monitor-exit p0

    throw v2

    .line 2595
    .restart local v1    # "nextPacket":[B
    :cond_1
    :try_start_4
    iget-object v5, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->controller:Lcom/disney/emagine/sdk/ble/EMTController;

    iget-object v6, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mWriteCharacteristic:Landroid/bluetooth/BluetoothGattCharacteristic;

    iget v7, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->EMAGINE_WRITEMODE:I

    invoke-virtual {v5, v1, v6, v7}, Lcom/disney/emagine/sdk/ble/EMTController;->writePacket([BLandroid/bluetooth/BluetoothGattCharacteristic;I)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 2601
    :try_start_5
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->packetsToWrite:Ljava/util/ArrayList;

    const/4 v5, 0x0

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 2604
    .end local v1    # "nextPacket":[B
    :cond_2
    monitor-exit v4

    move v2, v3

    .line 2607
    goto :goto_0

    .line 2596
    .restart local v1    # "nextPacket":[B
    :catch_0
    move-exception v0

    .line 2597
    .local v0, "e":Ljava/io/IOException;
    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v5, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v6, "Error writing packet."

    invoke-virtual {v3, v5, v6}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2598
    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->packetsToWrite:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 2599
    monitor-exit v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_0
.end method

.method private encodeAndSendOperation(SLcom/disney/emagine/sdk/EMTMessage;Ljava/util/HashMap;)Z
    .locals 2
    .param p1, "opcode"    # S
    .param p2, "message"    # Lcom/disney/emagine/sdk/EMTMessage;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(S",
            "Lcom/disney/emagine/sdk/EMTMessage;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 2495
    .local p3, "parameters":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-nez p2, :cond_0

    .line 2496
    const/4 v0, 0x0

    .line 2565
    :goto_0
    return v0

    .line 2500
    :cond_0
    invoke-static {}, Lcom/disney/emagine/app/EmagineApplication;->app()Lcom/disney/emagine/app/EmagineApplication;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/emagine/app/EmagineApplication;->backgroundHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/disney/emagine/sdk/ble/EMTDevice$5;

    invoke-direct {v1, p0, p1, p3, p2}, Lcom/disney/emagine/sdk/ble/EMTDevice$5;-><init>(Lcom/disney/emagine/sdk/ble/EMTDevice;SLjava/util/HashMap;Lcom/disney/emagine/sdk/EMTMessage;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 2565
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private fragmentAndEnqueue(Lcom/disney/emagine/sdk/EMTMessage;)Z
    .locals 27
    .param p1, "message"    # Lcom/disney/emagine/sdk/EMTMessage;

    .prologue
    .line 905
    if-nez p1, :cond_0

    .line 907
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v21, v0

    sget-object v22, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v23, "Your message object is null"

    invoke-virtual/range {v21 .. v23}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 909
    const/16 v21, 0x0

    .line 1083
    :goto_0
    return v21

    .line 926
    :cond_0
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/disney/emagine/sdk/EMTMessage;->data:[B

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    array-length v14, v0

    .line 927
    .local v14, "length":I
    const/16 v21, 0xb

    move/from16 v0, v21

    new-array v5, v0, [B

    .line 928
    .local v5, "buffer":[B
    const/16 v19, 0x0

    .line 929
    .local v19, "sequenceNumber":S
    const/4 v11, 0x0

    .line 930
    .local v11, "headerLength":I
    new-instance v18, Ljava/util/ArrayList;

    invoke-direct/range {v18 .. v18}, Ljava/util/ArrayList;-><init>()V

    .line 931
    .local v18, "packets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<[B>;"
    const/16 v16, 0x0

    .line 932
    .local v16, "offset":I
    const/4 v9, 0x1

    .line 934
    .local v9, "firstSegment":Z
    :goto_1
    move/from16 v0, v16

    int-to-long v0, v0

    move-wide/from16 v22, v0

    move-object/from16 v0, p1

    iget-wide v0, v0, Lcom/disney/emagine/sdk/EMTMessage;->length:J

    move-wide/from16 v24, v0

    cmp-long v21, v22, v24

    if-gez v21, :cond_8

    .line 936
    const/16 v21, 0x0

    move/from16 v0, v21

    invoke-static {v5, v0}, Lcom/disney/emagine/sdk/EMTData;->memsetBytes([BB)[B

    .line 938
    new-instance v10, Lcom/disney/emagine/sdk/EMTMessageHeader;

    invoke-direct {v10, v5}, Lcom/disney/emagine/sdk/EMTMessageHeader;-><init>([B)V

    .line 940
    .local v10, "header":Lcom/disney/emagine/sdk/EMTMessageHeader;
    invoke-static/range {v19 .. v19}, Lcom/disney/emagine/sdk/EMTData;->shortToByte(S)B

    move-result v21

    move/from16 v0, v21

    invoke-virtual {v10, v0}, Lcom/disney/emagine/sdk/EMTMessageHeader;->setSequenceNumber(B)V

    .line 942
    if-nez v19, :cond_6

    const/16 v21, 0x1

    move/from16 v0, v21

    if-ne v9, v0, :cond_6

    .line 944
    const/4 v9, 0x0

    .line 948
    const/4 v11, 0x3

    .line 950
    const/16 v21, 0x0

    move/from16 v0, v21

    invoke-virtual {v10, v0}, Lcom/disney/emagine/sdk/EMTMessageHeader;->setProtocolVersion(B)V

    .line 951
    int-to-short v0, v14

    move/from16 v21, v0

    move/from16 v0, v21

    invoke-virtual {v10, v0}, Lcom/disney/emagine/sdk/EMTMessageHeader;->setMessageSize(S)V

    .line 954
    add-int/lit8 v11, v11, 0x4

    .line 957
    invoke-virtual {v10}, Lcom/disney/emagine/sdk/EMTMessageHeader;->setForwardFlag()V

    .line 959
    new-instance v22, Lcom/disney/emagine/sdk/apple/NSAssert;

    move-object/from16 v0, p1

    iget v0, v0, Lcom/disney/emagine/sdk/EMTMessage;->targetAddress:I

    move/from16 v21, v0

    if-eqz v21, :cond_1

    const/16 v21, 0x1

    :goto_2
    const-string v23, "A target radio address of RADIO_INVALID_ADDRESS was found."

    move-object/from16 v0, v22

    move/from16 v1, v21

    move-object/from16 v2, v23

    invoke-direct {v0, v1, v2}, Lcom/disney/emagine/sdk/apple/NSAssert;-><init>(ZLjava/lang/String;)V

    .line 961
    move-object/from16 v0, p1

    iget v0, v0, Lcom/disney/emagine/sdk/EMTMessage;->targetAddress:I

    move/from16 v21, v0

    move/from16 v0, v21

    invoke-virtual {v10, v0}, Lcom/disney/emagine/sdk/EMTMessageHeader;->setTargetAddress(I)V

    .line 962
    const v21, 0xfffe

    move/from16 v0, v21

    invoke-virtual {v10, v0}, Lcom/disney/emagine/sdk/EMTMessageHeader;->setSenderAddress(I)V

    .line 964
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mCrypto:Lcom/disney/emagine/sdk/crypto/EMTCrypto;

    move-object/from16 v21, v0

    .line 966
    const/4 v15, 0x0

    .line 969
    .local v15, "nonce":[B
    move-object/from16 v0, p1

    iget-byte v0, v0, Lcom/disney/emagine/sdk/EMTMessage;->keySlot:B

    move/from16 v21, v0

    if-nez v21, :cond_2

    .line 971
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->keyStore:Lcom/disney/emagine/sdk/keystore/EMTKeyStore;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->appKey()Ljava/lang/String;

    move-result-object v4

    .line 972
    .local v4, "appKey":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->keyStore:Lcom/disney/emagine/sdk/keystore/EMTKeyStore;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->sessionKey()Ljava/lang/String;

    move-result-object v20

    .line 973
    .local v20, "sesKey":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->keyStore:Lcom/disney/emagine/sdk/keystore/EMTKeyStore;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->factoryKey()Ljava/lang/String;

    move-result-object v8

    .line 975
    .local v8, "facKey":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v21, v0

    sget-object v22, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v23, "keysDict;::%s\nappKey;::%s\nsessionKey;::%s\nfactoryKey;::%s\n"

    const/16 v24, 0x4

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->keyStore:Lcom/disney/emagine/sdk/keystore/EMTKeyStore;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->keysDict:Ljava/util/HashMap;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Ljava/util/HashMap;->toString()Ljava/lang/String;

    move-result-object v26

    aput-object v26, v24, v25

    const/16 v25, 0x1

    aput-object v4, v24, v25

    const/16 v25, 0x2

    aput-object v20, v24, v25

    const/16 v25, 0x3

    aput-object v8, v24, v25

    invoke-static/range {v23 .. v24}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v21 .. v23}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 976
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v21, v0

    sget-object v22, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v23, "Dropping message [%s] since there is no session or owner key"

    const/16 v24, 0x1

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/disney/emagine/sdk/EMTMessage;->data:[B

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v26

    aput-object v26, v24, v25

    invoke-static/range {v23 .. v24}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v21 .. v23}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 978
    const/16 v21, 0x0

    goto/16 :goto_0

    .line 959
    .end local v4    # "appKey":Ljava/lang/String;
    .end local v8    # "facKey":Ljava/lang/String;
    .end local v15    # "nonce":[B
    .end local v20    # "sesKey":Ljava/lang/String;
    :cond_1
    const/16 v21, 0x0

    goto/16 :goto_2

    .line 982
    .restart local v15    # "nonce":[B
    :cond_2
    add-int/lit8 v11, v11, 0x4

    .line 984
    move-object/from16 v0, p0

    iget v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->frameCounter:I

    move/from16 v21, v0

    add-int/lit8 v21, v21, 0x1

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->frameCounter:I

    move/from16 v0, v21

    invoke-virtual {v10, v0}, Lcom/disney/emagine/sdk/EMTMessageHeader;->setFrameCounter(I)V

    .line 985
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v21, v0

    sget-object v22, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "SEND TO MOLA ------> FRAME COUNTER : "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p0

    iget v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->frameCounter:I

    move/from16 v24, v0

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v21 .. v23}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 988
    move-object/from16 v0, p1

    iget-byte v0, v0, Lcom/disney/emagine/sdk/EMTMessage;->keySlot:B

    move/from16 v21, v0

    move/from16 v0, v21

    invoke-virtual {v10, v0}, Lcom/disney/emagine/sdk/EMTMessageHeader;->setKeySlot(B)V

    .line 989
    new-instance v22, Lcom/disney/emagine/sdk/apple/NSAssert;

    move-object/from16 v0, p1

    iget-byte v0, v0, Lcom/disney/emagine/sdk/EMTMessage;->keySlot:B

    move/from16 v21, v0

    invoke-virtual {v10}, Lcom/disney/emagine/sdk/EMTMessageHeader;->keySlot()B

    move-result v23

    move/from16 v0, v21

    move/from16 v1, v23

    if-ne v0, v1, :cond_3

    const/16 v21, 0x1

    :goto_3
    const-string v23, "Assert: Key Slot is not the same"

    move-object/from16 v0, v22

    move/from16 v1, v21

    move-object/from16 v2, v23

    invoke-direct {v0, v1, v2}, Lcom/disney/emagine/sdk/apple/NSAssert;-><init>(ZLjava/lang/String;)V

    .line 991
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->keyStore:Lcom/disney/emagine/sdk/keystore/EMTKeyStore;

    move-object/from16 v21, v0

    move-object/from16 v0, p1

    iget-byte v0, v0, Lcom/disney/emagine/sdk/EMTMessage;->keySlot:B

    move/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->keyForSlot(B)[B

    move-result-object v13

    .line 993
    .local v13, "key":[B
    new-instance v22, Lcom/disney/emagine/sdk/apple/NSAssert;

    if-eqz v13, :cond_4

    const/16 v21, 0x1

    :goto_4
    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "There is no key for this message. keyslot = "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p1

    iget-byte v0, v0, Lcom/disney/emagine/sdk/EMTMessage;->keySlot:B

    move/from16 v24, v0

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v22

    move/from16 v1, v21

    move-object/from16 v2, v23

    invoke-direct {v0, v1, v2}, Lcom/disney/emagine/sdk/apple/NSAssert;-><init>(ZLjava/lang/String;)V

    .line 995
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lcom/disney/emagine/sdk/ble/EMTDevice;->generateNonceWithHeader(Lcom/disney/emagine/sdk/EMTMessageHeader;)[B

    move-result-object v15

    .line 998
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mCrypto:Lcom/disney/emagine/sdk/crypto/EMTCrypto;

    move-object/from16 v21, v0

    add-int/lit8 v21, v14, 0x4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mCrypto:Lcom/disney/emagine/sdk/crypto/EMTCrypto;

    move-object/from16 v22, v0

    add-int/lit8 v21, v21, 0x10

    move/from16 v0, v21

    new-array v12, v0, [B

    .line 1000
    .local v12, "in":[B
    const/16 v21, 0x0

    move/from16 v0, v21

    invoke-static {v12, v0}, Lcom/disney/emagine/sdk/EMTData;->memsetBytes([BB)[B

    .line 1001
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/disney/emagine/sdk/EMTMessage;->data:[B

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-static {v0, v12, v14}, Lcom/disney/emagine/sdk/EMTData;->copyOf([B[BI)[B

    .line 1003
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mCrypto:Lcom/disney/emagine/sdk/crypto/EMTCrypto;

    move-object/from16 v21, v0

    .line 1019
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mCrypto:Lcom/disney/emagine/sdk/crypto/EMTCrypto;

    move-object/from16 v21, v0

    invoke-static {v12, v14, v15, v13}, Lcom/disney/emagine/sdk/crypto/EMTCrypto;->aesCCMEncrypt([BI[B[B)[B

    move-result-object v7

    .line 1021
    .local v7, "encryptedData":[B
    if-eqz v7, :cond_5

    .line 1023
    const/16 v21, 0x0

    array-length v0, v7

    move/from16 v22, v0

    move/from16 v0, v21

    move/from16 v1, v22

    invoke-static {v7, v0, v1}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, p1

    iput-object v0, v1, Lcom/disney/emagine/sdk/EMTMessage;->data:[B

    .line 1024
    array-length v0, v7

    move/from16 v21, v0

    move/from16 v0, v21

    int-to-long v0, v0

    move-wide/from16 v22, v0

    move-wide/from16 v0, v22

    move-object/from16 v2, p1

    iput-wide v0, v2, Lcom/disney/emagine/sdk/EMTMessage;->length:J

    .line 1027
    array-length v0, v7

    move/from16 v21, v0

    move/from16 v0, v21

    int-to-short v0, v0

    move/from16 v21, v0

    move/from16 v0, v21

    invoke-virtual {v10, v0}, Lcom/disney/emagine/sdk/EMTMessageHeader;->setMessageSize(S)V

    .line 1042
    .end local v7    # "encryptedData":[B
    .end local v12    # "in":[B
    .end local v13    # "key":[B
    .end local v15    # "nonce":[B
    :goto_5
    invoke-virtual {v10}, Lcom/disney/emagine/sdk/EMTMessageHeader;->header()[B

    move-result-object v21

    const/16 v22, 0x0

    move-object/from16 v0, v21

    move/from16 v1, v22

    invoke-static {v0, v1, v11}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v17

    .line 1043
    .local v17, "packet":[B
    rsub-int/lit8 v6, v11, 0x14

    .line 1045
    .local v6, "canFit":I
    move-object/from16 v0, p1

    iget-wide v0, v0, Lcom/disney/emagine/sdk/EMTMessage;->length:J

    move-wide/from16 v22, v0

    move/from16 v0, v16

    int-to-long v0, v0

    move-wide/from16 v24, v0

    sub-long v22, v22, v24

    int-to-long v0, v6

    move-wide/from16 v24, v0

    cmp-long v21, v22, v24

    if-gez v21, :cond_7

    .line 1047
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/disney/emagine/sdk/EMTMessage;->data:[B

    move-object/from16 v21, v0

    move-object/from16 v0, p1

    iget-wide v0, v0, Lcom/disney/emagine/sdk/EMTMessage;->length:J

    move-wide/from16 v22, v0

    move-wide/from16 v0, v22

    long-to-int v0, v0

    move/from16 v22, v0

    move-object/from16 v0, v21

    move/from16 v1, v16

    move/from16 v2, v22

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v21

    move-object/from16 v0, v17

    move-object/from16 v1, v21

    invoke-static {v0, v1}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v17

    .line 1049
    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1051
    const/16 v17, 0x0

    .line 1052
    move-object/from16 v0, p1

    iget-wide v0, v0, Lcom/disney/emagine/sdk/EMTMessage;->length:J

    move-wide/from16 v22, v0

    move-wide/from16 v0, v22

    long-to-int v0, v0

    move/from16 v16, v0

    .line 1063
    :goto_6
    add-int/lit8 v21, v19, 0x1

    move/from16 v0, v21

    int-to-short v0, v0

    move/from16 v19, v0

    .line 1064
    and-int/lit8 v21, v19, 0x3f

    move/from16 v0, v21

    int-to-short v0, v0

    move/from16 v19, v0

    .line 1065
    goto/16 :goto_1

    .line 989
    .end local v6    # "canFit":I
    .end local v17    # "packet":[B
    .restart local v15    # "nonce":[B
    :cond_3
    const/16 v21, 0x0

    goto/16 :goto_3

    .line 993
    .restart local v13    # "key":[B
    :cond_4
    const/16 v21, 0x0

    goto/16 :goto_4

    .line 1031
    .restart local v7    # "encryptedData":[B
    .restart local v12    # "in":[B
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v21, v0

    sget-object v22, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v23, "Error: Message size on encryption is not matching what is expected."

    invoke-virtual/range {v21 .. v23}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1032
    const/16 v21, 0x0

    goto/16 :goto_0

    .line 1039
    .end local v7    # "encryptedData":[B
    .end local v12    # "in":[B
    .end local v13    # "key":[B
    .end local v15    # "nonce":[B
    :cond_6
    const/4 v11, 0x1

    goto/16 :goto_5

    .line 1056
    .restart local v6    # "canFit":I
    .restart local v17    # "packet":[B
    :cond_7
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/disney/emagine/sdk/EMTMessage;->data:[B

    move-object/from16 v21, v0

    add-int v22, v16, v6

    move-object/from16 v0, v21

    move/from16 v1, v16

    move/from16 v2, v22

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v21

    move-object/from16 v0, v17

    move-object/from16 v1, v21

    invoke-static {v0, v1}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v17

    .line 1057
    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1059
    add-int v16, v16, v6

    goto :goto_6

    .line 1072
    .end local v6    # "canFit":I
    .end local v10    # "header":Lcom/disney/emagine/sdk/EMTMessageHeader;
    .end local v17    # "packet":[B
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->packetsToWrite:Ljava/util/ArrayList;

    move-object/from16 v22, v0

    monitor-enter v22

    .line 1074
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->packetsToWrite:Ljava/util/ArrayList;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1075
    monitor-exit v22
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1077
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v21, v0

    sget-object v22, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Frame Counter = "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p0

    iget v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->frameCounter:I

    move/from16 v24, v0

    move/from16 v0, v24

    int-to-long v0, v0

    move-wide/from16 v24, v0

    invoke-virtual/range {v23 .. v25}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v21 .. v23}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1079
    invoke-direct/range {p0 .. p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->drainPacketQueue()Z

    move-result v21

    if-nez v21, :cond_9

    .line 1081
    const/16 v21, 0x0

    goto/16 :goto_0

    .line 1075
    :catchall_0
    move-exception v21

    :try_start_1
    monitor-exit v22
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v21

    .line 1083
    :cond_9
    const/16 v21, 0x1

    goto/16 :goto_0
.end method

.method private isRadioAddressAvailable()Z
    .locals 2

    .prologue
    .line 1984
    iget-wide v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    invoke-direct {p0, v0, v1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->radioIDFromDeviceID(J)J

    move-result-wide v0

    long-to-int v0, v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private operationFromData([B)Ljava/util/HashMap;
    .locals 27
    .param p1, "data"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B)",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1755
    new-instance v20, Ljava/util/HashMap;

    invoke-direct/range {v20 .. v20}, Ljava/util/HashMap;-><init>()V

    .line 1760
    .local v20, "result":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/16 v23, 0x0

    const/16 v24, 0x2

    move-object/from16 v0, p1

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/disney/emagine/sdk/EMTData;->ushortBytesToInt([B)I

    move-result v18

    .line 1763
    .local v18, "opcode":I
    const v23, 0xfffd

    move/from16 v0, v18

    move/from16 v1, v23

    if-ne v0, v1, :cond_0

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v23, v0

    const/16 v24, 0x18

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_0

    const/16 v23, 0x8

    const/16 v24, 0xa

    move-object/from16 v0, p1

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/disney/emagine/sdk/EMTData;->ushortBytesToInt([B)I

    move-result v23

    const/16 v24, 0x138b

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_0

    .line 1765
    const v18, 0xfffe

    .line 1768
    :cond_0
    const-string v23, "opcode"

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    move-object/from16 v0, v20

    move-object/from16 v1, v23

    move-object/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1772
    sparse-switch v18, :sswitch_data_0

    .line 1932
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v23, v0

    sget-object v24, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "Unknown OPCODE(%d) <--- RECEIVED"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v23 .. v25}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1936
    :cond_1
    :goto_0
    return-object v20

    .line 1778
    :sswitch_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v23, v0

    sget-object v24, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v25, "RECEIVE FROM MOLA <------ PING or PING_RESPONSE"

    invoke-virtual/range {v23 .. v25}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1779
    const/16 v23, 0x2

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v24, v0

    move-object/from16 v0, p1

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v19

    .line 1781
    .local v19, "payload":[B
    const-string v23, "payload"

    move-object/from16 v0, v20

    move-object/from16 v1, v23

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 1789
    .end local v19    # "payload":[B
    :sswitch_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v23, v0

    sget-object v24, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v25, "RECEIVE FROM MOLA <------ UPDATE_FIRMWARE_RESPONSE"

    invoke-virtual/range {v23 .. v25}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1790
    const/16 v23, 0x2

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v24, v0

    move-object/from16 v0, p1

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v19

    .line 1792
    .restart local v19    # "payload":[B
    const-string v23, "payload"

    move-object/from16 v0, v20

    move-object/from16 v1, v23

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 1799
    .end local v19    # "payload":[B
    :sswitch_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v23, v0

    sget-object v24, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v25, "RECEIVE FROM MOLA <------ FILE_TRANSFER_START"

    invoke-virtual/range {v23 .. v25}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1801
    const/16 v23, 0x2

    const/16 v24, 0x6

    move-object/from16 v0, p1

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/disney/emagine/sdk/EMTData;->uintBytesToLongObject([B)Ljava/lang/Long;

    move-result-object v4

    .line 1802
    .local v4, "crc32":Ljava/lang/Long;
    const/16 v23, 0x6

    const/16 v24, 0xa

    move-object/from16 v0, p1

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/disney/emagine/sdk/EMTData;->uintBytesToLongObject([B)Ljava/lang/Long;

    move-result-object v11

    .line 1803
    .local v11, "filesize":Ljava/lang/Long;
    const/16 v23, 0xa

    const/16 v24, 0xc

    move-object/from16 v0, p1

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/disney/emagine/sdk/EMTData;->ushortBytesToInt([B)I

    move-result v10

    .line 1804
    .local v10, "filenameLength":I
    const/16 v23, 0xc

    const/16 v24, 0x10

    move-object/from16 v0, p1

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/disney/emagine/sdk/EMTData;->uintBytesToLongObject([B)Ljava/lang/Long;

    move-result-object v22

    .line 1805
    .local v22, "version":Ljava/lang/Long;
    const/16 v23, 0x10

    const/16 v24, 0x11

    move-object/from16 v0, p1

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v23

    const/16 v24, 0x0

    aget-byte v23, v23, v24

    invoke-static/range {v23 .. v23}, Lcom/disney/emagine/sdk/EMTData;->byteToByteObject(B)Ljava/lang/Byte;

    move-result-object v12

    .line 1806
    .local v12, "flags":Ljava/lang/Byte;
    const/16 v23, 0x11

    add-int/lit8 v24, v10, 0x11

    move-object/from16 v0, p1

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v9

    .line 1807
    .local v9, "filenameData":[B
    invoke-static {v9}, Lcom/disney/emagine/sdk/EMTData;->bytesToASCIIString([B)Ljava/lang/String;

    move-result-object v8

    .line 1809
    .local v8, "filename":Ljava/lang/String;
    const-string v23, "size"

    move-object/from16 v0, v20

    move-object/from16 v1, v23

    invoke-virtual {v0, v1, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1810
    const-string v23, "version"

    move-object/from16 v0, v20

    move-object/from16 v1, v23

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1811
    const-string v23, "filename"

    move-object/from16 v0, v20

    move-object/from16 v1, v23

    invoke-virtual {v0, v1, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1812
    const-string v23, "crc32"

    move-object/from16 v0, v20

    move-object/from16 v1, v23

    invoke-virtual {v0, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1813
    const-string v23, "flags"

    move-object/from16 v0, v20

    move-object/from16 v1, v23

    invoke-virtual {v0, v1, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 1821
    .end local v4    # "crc32":Ljava/lang/Long;
    .end local v8    # "filename":Ljava/lang/String;
    .end local v9    # "filenameData":[B
    .end local v10    # "filenameLength":I
    .end local v11    # "filesize":Ljava/lang/Long;
    .end local v12    # "flags":Ljava/lang/Byte;
    .end local v22    # "version":Ljava/lang/Long;
    :sswitch_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v23, v0

    sget-object v24, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v25, "RECEIVE FROM MOLA <------ FILE_TRANSFER_ACCEPT"

    invoke-virtual/range {v23 .. v25}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1822
    const/16 v23, 0x2

    const/16 v24, 0x4

    move-object/from16 v0, p1

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/disney/emagine/sdk/EMTData;->ushortBytesToIntObject([B)Ljava/lang/Integer;

    move-result-object v21

    .line 1823
    .local v21, "status":Ljava/lang/Integer;
    const/16 v23, 0x4

    const/16 v24, 0x6

    move-object/from16 v0, p1

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/disney/emagine/sdk/EMTData;->ushortBytesToIntObject([B)Ljava/lang/Integer;

    move-result-object v14

    .line 1825
    .local v14, "maxPacket":Ljava/lang/Integer;
    const-string v23, "status"

    move-object/from16 v0, v20

    move-object/from16 v1, v23

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1826
    const-string v23, "packetMTU"

    move-object/from16 v0, v20

    move-object/from16 v1, v23

    invoke-virtual {v0, v1, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1829
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v23, v0

    const/16 v24, 0xe

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_1

    .line 1831
    const/16 v23, 0x6

    const/16 v24, 0xa

    move-object/from16 v0, p1

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/disney/emagine/sdk/EMTData;->uintBytesToLongObject([B)Ljava/lang/Long;

    move-result-object v7

    .line 1832
    .local v7, "fileIndex":Ljava/lang/Long;
    const/16 v23, 0xa

    const/16 v24, 0xe

    move-object/from16 v0, p1

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/disney/emagine/sdk/EMTData;->uintBytesToLongObject([B)Ljava/lang/Long;

    move-result-object v4

    .line 1834
    .restart local v4    # "crc32":Ljava/lang/Long;
    const-string v23, "fileIndex"

    move-object/from16 v0, v20

    move-object/from16 v1, v23

    invoke-virtual {v0, v1, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1835
    const-string v23, "crc32"

    move-object/from16 v0, v20

    move-object/from16 v1, v23

    invoke-virtual {v0, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 1843
    .end local v4    # "crc32":Ljava/lang/Long;
    .end local v7    # "fileIndex":Ljava/lang/Long;
    .end local v14    # "maxPacket":Ljava/lang/Integer;
    .end local v21    # "status":Ljava/lang/Integer;
    :sswitch_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v23, v0

    sget-object v24, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v25, "RECEIVE FROM MOLA <------ FILE_TRANSFER_RESET"

    invoke-virtual/range {v23 .. v25}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1845
    const/16 v23, 0x2

    const/16 v24, 0x6

    move-object/from16 v0, p1

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/disney/emagine/sdk/EMTData;->uintBytesToLong([B)J

    move-result-wide v16

    .line 1847
    .local v16, "offset":J
    const-string v23, "offset"

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v24

    move-object/from16 v0, v20

    move-object/from16 v1, v23

    move-object/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 1855
    .end local v16    # "offset":J
    :sswitch_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v23, v0

    sget-object v24, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v25, "RECEIVE FROM MOLA <------ FILE_TRANSFER_DATA"

    invoke-virtual/range {v23 .. v25}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1857
    const/16 v23, 0x2

    const/16 v24, 0x6

    move-object/from16 v0, p1

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/disney/emagine/sdk/EMTData;->uintBytesToLongObject([B)Ljava/lang/Long;

    move-result-object v16

    .line 1858
    .local v16, "offset":Ljava/lang/Long;
    const/16 v23, 0x7

    const/16 v24, 0x9

    move-object/from16 v0, p1

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/disney/emagine/sdk/EMTData;->ushortBytesToInt([B)I

    move-result v6

    .line 1859
    .local v6, "fileDataLength":I
    const/16 v23, 0x9

    add-int/lit8 v24, v6, 0x9

    move-object/from16 v0, p1

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v5

    .line 1861
    .local v5, "fileData":[B
    const-string v23, "offset"

    move-object/from16 v0, v20

    move-object/from16 v1, v23

    move-object/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1862
    const-string v23, "data"

    move-object/from16 v0, v20

    move-object/from16 v1, v23

    invoke-virtual {v0, v1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 1869
    .end local v5    # "fileData":[B
    .end local v6    # "fileDataLength":I
    .end local v16    # "offset":Ljava/lang/Long;
    :sswitch_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v23, v0

    sget-object v24, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v25, "RECEIVE FROM MOLA <------ FILE_TRANSFER_ACK"

    invoke-virtual/range {v23 .. v25}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1877
    :sswitch_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v23, v0

    sget-object v24, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v25, "RECEIVE FROM MOLA <----- CUSTOM_LUA_EVENT"

    invoke-virtual/range {v23 .. v25}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1878
    const/16 v23, 0x4

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v24, v0

    move-object/from16 v0, p1

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v19

    .line 1880
    .restart local v19    # "payload":[B
    const-string v23, "payload"

    move-object/from16 v0, v20

    move-object/from16 v1, v23

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 1887
    .end local v19    # "payload":[B
    :sswitch_8
    const-string v23, "payload"

    move-object/from16 v0, v20

    move-object/from16 v1, v23

    move-object/from16 v2, p1

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 1894
    :sswitch_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v23, v0

    sget-object v24, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v25, "RECEIVE FROM MOLA <----- PACKET_NACK"

    invoke-virtual/range {v23 .. v25}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1901
    :sswitch_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v23, v0

    sget-object v24, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v25, "RECEIVE FROM MOLA <------ FILE_TRANSFER_NACK"

    invoke-virtual/range {v23 .. v25}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1909
    :sswitch_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v23, v0

    sget-object v24, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v25, "RECEIVE FROM MOLA <------ MESSAGE_ACK"

    invoke-virtual/range {v23 .. v25}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1910
    const/16 v23, 0x2

    const/16 v24, 0x6

    move-object/from16 v0, p1

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/disney/emagine/sdk/EMTData;->bytesToInt([B)I

    move-result v13

    .line 1912
    .local v13, "frameCounter":I
    const-string v23, "frame_counter"

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    move-object/from16 v0, v20

    move-object/from16 v1, v23

    move-object/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 1919
    .end local v13    # "frameCounter":I
    :sswitch_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v23, v0

    sget-object v24, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v25, "RECEIVE FROM MOLA <------ NONCE_REQUEST: Received Nonce Request Message"

    invoke-virtual/range {v23 .. v25}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1921
    new-instance v24, Lcom/disney/emagine/sdk/apple/NSAssert;

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v23, v0

    add-int/lit8 v23, v23, -0x2

    move-object/from16 v0, p0

    iget-byte v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->NONCE_SIZE:B

    move/from16 v25, v0

    move/from16 v0, v23

    move/from16 v1, v25

    if-ne v0, v1, :cond_2

    const/16 v23, 0x1

    :goto_1
    const-string v25, "Error: Received nonce size is not what is expected."

    move-object/from16 v0, v24

    move/from16 v1, v23

    move-object/from16 v2, v25

    invoke-direct {v0, v1, v2}, Lcom/disney/emagine/sdk/apple/NSAssert;-><init>(ZLjava/lang/String;)V

    .line 1923
    const/16 v23, 0x2

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v24, v0

    move-object/from16 v0, p1

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v15

    .line 1925
    .local v15, "nonce":[B
    const-string v23, "nonce"

    move-object/from16 v0, v20

    move-object/from16 v1, v23

    invoke-virtual {v0, v1, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 1921
    .end local v15    # "nonce":[B
    :cond_2
    const/16 v23, 0x0

    goto :goto_1

    .line 1772
    nop

    :sswitch_data_0
    .sparse-switch
        0x3fff -> :sswitch_2
        0x4000 -> :sswitch_3
        0x4001 -> :sswitch_4
        0x4002 -> :sswitch_5
        0x4003 -> :sswitch_6
        0x4004 -> :sswitch_a
        0x4005 -> :sswitch_0
        0x4006 -> :sswitch_0
        0x400b -> :sswitch_1
        0x400c -> :sswitch_c
        0x6050 -> :sswitch_9
        0x6051 -> :sswitch_b
        0xfffd -> :sswitch_7
        0xfffe -> :sswitch_8
    .end sparse-switch
.end method

.method private parseAndHandleMessage(Lcom/disney/emagine/sdk/EMTMessage;)V
    .locals 42
    .param p1, "message"    # Lcom/disney/emagine/sdk/EMTMessage;

    .prologue
    .line 1994
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v32

    move-wide/from16 v0, v32

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/disney/emagine/sdk/ble/EMTDevice;->lastTimeMsgReceived:J

    .line 1995
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/disney/emagine/sdk/EMTMessage;->data:[B

    move-object/from16 v32, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    invoke-direct {v0, v1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->operationFromData([B)Ljava/util/HashMap;

    move-result-object v13

    .line 1996
    .local v13, "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v32, "opcode"

    move-object/from16 v0, v32

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Ljava/lang/Integer;

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Integer;->intValue()I

    move-result v21

    .line 1998
    .local v21, "opcode":I
    sparse-switch v21, :sswitch_data_0

    .line 2488
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v33, v0

    sget-object v34, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    sget-object v35, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v36, "Error, %02d Opcode not defined."

    const/16 v32, 0x1

    move/from16 v0, v32

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v37, v0

    const/16 v38, 0x0

    const-string v32, "opcode"

    move-object/from16 v0, v32

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, [B

    check-cast v32, [B

    invoke-static/range {v32 .. v32}, Lcom/disney/emagine/sdk/EMTData;->bytesToShort([B)S

    move-result v32

    invoke-static/range {v32 .. v32}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v32

    aput-object v32, v37, v38

    invoke-static/range {v35 .. v37}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v33

    move-object/from16 v1, v34

    move-object/from16 v2, v32

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2491
    :cond_0
    :goto_0
    return-void

    .line 2002
    :sswitch_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v33, v0

    sget-object v34, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "RECIEVE <----- PING: "

    move-object/from16 v0, v32

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v35

    const-string v32, "result"

    move-object/from16 v0, v32

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, [B

    check-cast v32, [B

    invoke-static/range {v32 .. v32}, Lcom/disney/emagine/sdk/EMTData;->bytesToString([B)Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v35

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v33

    move-object/from16 v1, v34

    move-object/from16 v2, v32

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2004
    invoke-direct/range {p0 .. p1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->swapAddressForMessage(Lcom/disney/emagine/sdk/EMTMessage;)V

    .line 2005
    const/16 v32, 0x4006

    move-object/from16 v0, p0

    move/from16 v1, v32

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2, v13}, Lcom/disney/emagine/sdk/ble/EMTDevice;->encodeAndSendOperation(SLcom/disney/emagine/sdk/EMTMessage;Ljava/util/HashMap;)Z

    goto :goto_0

    .line 2013
    :sswitch_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v33, v0

    sget-object v34, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "RECIEVE <----- PING_RESPONSE: "

    move-object/from16 v0, v32

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v35

    const-string v32, "result"

    move-object/from16 v0, v32

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, [B

    check-cast v32, [B

    invoke-static/range {v32 .. v32}, Lcom/disney/emagine/sdk/EMTData;->bytesToString([B)Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v35

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v33

    move-object/from16 v1, v34

    move-object/from16 v2, v32

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2015
    const/16 v24, 0x0

    .line 2016
    .local v24, "operation":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v8, 0x0

    .line 2018
    .local v8, "completion":Lcom/disney/emagine/sdk/completion/EMTPingCompletion;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->pendingOperations:Ljava/util/ArrayList;

    move-object/from16 v32, v0

    invoke-virtual/range {v32 .. v32}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v33

    :cond_1
    :goto_1
    invoke-interface/range {v33 .. v33}, Ljava/util/Iterator;->hasNext()Z

    move-result v32

    if-eqz v32, :cond_2

    invoke-interface/range {v33 .. v33}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/util/HashMap;

    .line 2020
    .local v19, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v32, "opcode"

    move-object/from16 v0, v19

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, [B

    check-cast v32, [B

    invoke-static/range {v32 .. v32}, Lcom/disney/emagine/sdk/EMTData;->bytesToShort([B)S

    move-result v32

    const/16 v34, 0x4005

    move/from16 v0, v32

    move/from16 v1, v34

    if-ne v0, v1, :cond_1

    .line 2022
    move-object/from16 v24, v19

    .line 2024
    goto :goto_1

    .line 2028
    .end local v19    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_2
    if-eqz v24, :cond_0

    .line 2030
    const-string v32, "completion"

    move-object/from16 v0, v24

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "completion":Lcom/disney/emagine/sdk/completion/EMTPingCompletion;
    check-cast v8, Lcom/disney/emagine/sdk/completion/EMTPingCompletion;

    .line 2032
    .restart local v8    # "completion":Lcom/disney/emagine/sdk/completion/EMTPingCompletion;
    if-eqz v8, :cond_4

    .line 2034
    const/4 v15, 0x0

    .line 2036
    .local v15, "error":Lcom/disney/emagine/sdk/apple/NSError;
    const-string v32, "payload"

    move-object/from16 v0, v32

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v32

    const-string v33, "payload"

    move-object/from16 v0, v24

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v33

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    if-eq v0, v1, :cond_3

    .line 2038
    new-instance v15, Lcom/disney/emagine/sdk/apple/NSError;

    .end local v15    # "error":Lcom/disney/emagine/sdk/apple/NSError;
    const-string v32, "com.disney.eMagine"

    const/16 v33, 0x6

    const-string v34, "Ping payloads did not match!"

    move-object/from16 v0, v32

    move/from16 v1, v33

    move-object/from16 v2, v34

    invoke-direct {v15, v0, v1, v2}, Lcom/disney/emagine/sdk/apple/NSError;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 2041
    .restart local v15    # "error":Lcom/disney/emagine/sdk/apple/NSError;
    :cond_3
    invoke-virtual {v8, v15}, Lcom/disney/emagine/sdk/completion/EMTPingCompletion;->run(Lcom/disney/emagine/sdk/apple/NSError;)V

    .line 2044
    .end local v15    # "error":Lcom/disney/emagine/sdk/apple/NSError;
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->pendingOperations:Ljava/util/ArrayList;

    move-object/from16 v33, v0

    monitor-enter v33

    .line 2046
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->pendingOperations:Ljava/util/ArrayList;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 2047
    monitor-exit v33

    goto/16 :goto_0

    :catchall_0
    move-exception v32

    monitor-exit v33
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v32

    .line 2055
    .end local v8    # "completion":Lcom/disney/emagine/sdk/completion/EMTPingCompletion;
    .end local v24    # "operation":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :sswitch_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v33, v0

    sget-object v34, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "RECIEVE <----- UPDATE_FIRMWARE_RESPONSE: "

    move-object/from16 v0, v32

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v35

    const-string v32, "result"

    move-object/from16 v0, v32

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, [B

    check-cast v32, [B

    invoke-static/range {v32 .. v32}, Lcom/disney/emagine/sdk/EMTData;->bytesToString([B)Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v35

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v33

    move-object/from16 v1, v34

    move-object/from16 v2, v32

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2062
    :sswitch_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v32, v0

    sget-object v33, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "RECIEVE <----- FILE_TRANSFER_START - opcode("

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, ")"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v32 .. v34}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2064
    const/16 v32, 0x1

    move/from16 v0, v32

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->transferPending:Z

    .line 2065
    monitor-enter p0

    .line 2067
    :try_start_1
    new-instance v32, Lcom/disney/emagine/sdk/EMTFileTransfer;

    invoke-direct/range {v32 .. v32}, Lcom/disney/emagine/sdk/EMTFileTransfer;-><init>()V

    move-object/from16 v0, v32

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->incomingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    .line 2068
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->incomingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v33, v0

    const-string v32, "filename"

    move-object/from16 v0, v32

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Ljava/lang/String;

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    iput-object v0, v1, Lcom/disney/emagine/sdk/EMTFileTransfer;->filename:Ljava/lang/String;

    .line 2069
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->incomingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v33, v0

    const-string v32, "size"

    move-object/from16 v0, v32

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Ljava/lang/Long;

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Long;->longValue()J

    move-result-wide v34

    move-wide/from16 v0, v34

    move-object/from16 v2, v33

    iput-wide v0, v2, Lcom/disney/emagine/sdk/EMTFileTransfer;->expectedLength:J

    .line 2070
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->incomingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v33, v0

    const-string v32, "crc32"

    move-object/from16 v0, v32

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Ljava/lang/Long;

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Long;->longValue()J

    move-result-wide v34

    move-wide/from16 v0, v34

    move-object/from16 v2, v33

    iput-wide v0, v2, Lcom/disney/emagine/sdk/EMTFileTransfer;->crc32:J

    .line 2071
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->incomingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v33, v0

    const-string v32, "flags"

    move-object/from16 v0, v32

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Ljava/lang/Byte;

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Byte;->byteValue()B

    move-result v32

    move/from16 v0, v32

    move-object/from16 v1, v33

    iput-byte v0, v1, Lcom/disney/emagine/sdk/EMTFileTransfer;->flags:B

    .line 2072
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->incomingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    const/16 v33, 0x0

    move/from16 v0, v33

    new-array v0, v0, [B

    move-object/from16 v33, v0

    move-object/from16 v0, v33

    move-object/from16 v1, v32

    iput-object v0, v1, Lcom/disney/emagine/sdk/EMTFileTransfer;->contents:[B

    .line 2073
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->incomingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    move-object/from16 v0, p1

    iget v0, v0, Lcom/disney/emagine/sdk/EMTMessage;->senderAddress:I

    move/from16 v33, v0

    move/from16 v0, v33

    int-to-long v0, v0

    move-wide/from16 v34, v0

    move-object/from16 v0, p0

    move-wide/from16 v1, v34

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceIDFromRadioID(J)J

    move-result-wide v34

    move-wide/from16 v0, v34

    move-object/from16 v2, v32

    iput-wide v0, v2, Lcom/disney/emagine/sdk/EMTFileTransfer;->deviceId:J

    .line 2074
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 2075
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->controller:Lcom/disney/emagine/sdk/ble/EMTController;

    move-object/from16 v32, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->incomingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v33, v0

    move-object/from16 v0, v33

    iget-object v0, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->filename:Ljava/lang/String;

    move-object/from16 v33, v0

    move-object/from16 v0, v32

    move-object/from16 v1, p0

    move-object/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/ble/EMTController;->deviceRequestedFileTransfer(Lcom/disney/emagine/sdk/ble/EMTDevice;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2074
    :catchall_1
    move-exception v32

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v32

    .line 2082
    :sswitch_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v32, v0

    sget-object v33, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "RECIEVE <----- FILE_TRANSFER_ACCEPT - opcode("

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, ")"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v32 .. v34}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2084
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    if-nez v32, :cond_5

    .line 2086
    new-instance v15, Lcom/disney/emagine/sdk/apple/NSError;

    const-string v32, "com.disney.eMagine"

    const/16 v33, 0x6

    const-string v34, "Received an accept with no file in flight."

    move-object/from16 v0, v32

    move/from16 v1, v33

    move-object/from16 v2, v34

    invoke-direct {v15, v0, v1, v2}, Lcom/disney/emagine/sdk/apple/NSError;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 2088
    .restart local v15    # "error":Lcom/disney/emagine/sdk/apple/NSError;
    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceDidExperienceProtocolError(Lcom/disney/emagine/sdk/apple/NSError;)V

    goto/16 :goto_0

    .line 2092
    .end local v15    # "error":Lcom/disney/emagine/sdk/apple/NSError;
    :cond_5
    monitor-enter p0

    .line 2094
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    const/16 v33, 0x1

    move/from16 v0, v33

    move-object/from16 v1, v32

    iput-boolean v0, v1, Lcom/disney/emagine/sdk/EMTFileTransfer;->transferAccepted:Z

    .line 2095
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v33, v0

    const-string v32, "packetMTU"

    move-object/from16 v0, v32

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Ljava/lang/Integer;

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Integer;->intValue()I

    move-result v32

    move/from16 v0, v32

    move-object/from16 v1, v33

    iput v0, v1, Lcom/disney/emagine/sdk/EMTFileTransfer;->packetSize:I

    .line 2097
    const-string v32, "status"

    move-object/from16 v0, v32

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Ljava/lang/Integer;

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Integer;->intValue()I

    move-result v32

    if-nez v32, :cond_6

    .line 2100
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    iget-object v0, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->extras:Ljava/util/HashMap;

    move-object/from16 v32, v0

    const-string v33, "completion"

    invoke-virtual/range {v32 .. v33}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;

    .line 2102
    .local v8, "completion":Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;
    invoke-virtual/range {p0 .. p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->cancelAndInvalidate()V

    .line 2104
    new-instance v15, Lcom/disney/emagine/sdk/apple/NSError;

    const-string v32, "com.disney.eMagine"

    const/16 v33, 0x6

    const-string v34, "Board rejected file transfer."

    move-object/from16 v0, v32

    move/from16 v1, v33

    move-object/from16 v2, v34

    invoke-direct {v15, v0, v1, v2}, Lcom/disney/emagine/sdk/apple/NSError;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 2106
    .restart local v15    # "error":Lcom/disney/emagine/sdk/apple/NSError;
    const/16 v32, 0x1

    const/16 v33, 0x0

    move/from16 v0, v32

    move/from16 v1, v33

    invoke-virtual {v8, v15, v0, v1}, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->run(Lcom/disney/emagine/sdk/apple/NSError;ZI)V

    .line 2108
    monitor-exit p0

    goto/16 :goto_0

    .line 2169
    .end local v8    # "completion":Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;
    .end local v15    # "error":Lcom/disney/emagine/sdk/apple/NSError;
    :catchall_2
    move-exception v32

    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    throw v32

    .line 2114
    :cond_6
    :try_start_4
    const-string v32, "fileIndex"

    move-object/from16 v0, v32

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v32

    if-eqz v32, :cond_7

    const-string v32, "crc32"

    move-object/from16 v0, v32

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v32

    if-eqz v32, :cond_7

    .line 2116
    const-string v32, "fileIndex"

    move-object/from16 v0, v32

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Ljava/lang/Long;

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Long;->longValue()J

    move-result-wide v22

    .line 2117
    .local v22, "offset":J
    const-string v32, "crc32"

    move-object/from16 v0, v32

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Ljava/lang/Long;

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    .line 2120
    .local v4, "acceptCRC":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    const-wide/16 v34, 0x0

    move-wide/from16 v0, v34

    move-object/from16 v2, v32

    iput-wide v0, v2, Lcom/disney/emagine/sdk/EMTFileTransfer;->offset:J

    .line 2122
    const-wide/16 v32, 0x0

    cmp-long v32, v22, v32

    if-eqz v32, :cond_7

    .line 2125
    new-instance v9, Ljava/util/zip/CRC32;

    invoke-direct {v9}, Ljava/util/zip/CRC32;-><init>()V

    .line 2127
    .local v9, "crc32":Ljava/util/zip/CRC32;
    invoke-virtual {v9}, Ljava/util/zip/CRC32;->reset()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 2129
    :try_start_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    iget-object v0, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->uncompressedContents:[B

    move-object/from16 v32, v0

    const/16 v33, 0x0

    move-wide/from16 v0, v22

    long-to-int v0, v0

    move/from16 v34, v0

    move-object/from16 v0, v32

    move/from16 v1, v33

    move/from16 v2, v34

    invoke-virtual {v9, v0, v1, v2}, Ljava/util/zip/CRC32;->update([BII)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 2135
    :goto_2
    :try_start_6
    invoke-virtual {v9}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v6

    .line 2137
    .local v6, "calculatedCRC":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v32, v0

    sget-object v33, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v34, "************** Restart File Transfer **************"

    invoke-virtual/range {v32 .. v34}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2138
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v32, v0

    sget-object v33, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v34, "calculateCRC = [%d], acceptCRC = [%d], offset = [%d]"

    const/16 v35, 0x3

    move/from16 v0, v35

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v35, v0

    const/16 v36, 0x0

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v37

    aput-object v37, v35, v36

    const/16 v36, 0x1

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v37

    aput-object v37, v35, v36

    const/16 v36, 0x2

    invoke-static/range {v22 .. v23}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v37

    aput-object v37, v35, v36

    invoke-static/range {v34 .. v35}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v32 .. v34}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2140
    cmp-long v32, v6, v4

    if-nez v32, :cond_8

    .line 2142
    move-object/from16 v0, p0

    move-wide/from16 v1, v22

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/ble/EMTDevice;->initializeReset(J)V

    .line 2143
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    const/16 v33, 0x1

    move/from16 v0, v33

    move-object/from16 v1, v32

    iput-boolean v0, v1, Lcom/disney/emagine/sdk/EMTFileTransfer;->transferAccepted:Z

    .line 2144
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    move-wide/from16 v0, v22

    move-object/from16 v2, v32

    iput-wide v0, v2, Lcom/disney/emagine/sdk/EMTFileTransfer;->previousOffset:J

    .line 2146
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    iget-object v0, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->extras:Ljava/util/HashMap;

    move-object/from16 v32, v0

    const-string v33, "completion"

    invoke-virtual/range {v32 .. v33}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/disney/emagine/sdk/delegate/EMTTransferDelegate;

    .line 2147
    .local v8, "completion":Lcom/disney/emagine/sdk/delegate/EMTTransferDelegate;
    if-eqz v8, :cond_7

    .line 2150
    const/16 v32, 0x0

    const/16 v33, 0x0

    move-wide/from16 v0, v22

    long-to-int v0, v0

    move/from16 v34, v0

    move-object/from16 v0, v32

    move/from16 v1, v33

    move/from16 v2, v34

    invoke-interface {v8, v0, v1, v2}, Lcom/disney/emagine/sdk/delegate/EMTTransferDelegate;->run(Lcom/disney/emagine/sdk/apple/NSError;ZI)V

    .line 2167
    .end local v4    # "acceptCRC":J
    .end local v6    # "calculatedCRC":J
    .end local v8    # "completion":Lcom/disney/emagine/sdk/delegate/EMTTransferDelegate;
    .end local v9    # "crc32":Ljava/util/zip/CRC32;
    .end local v22    # "offset":J
    :cond_7
    const/16 v32, 0x0

    move/from16 v0, v32

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->waitingForACK:Z

    .line 2168
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    const/16 v33, 0x1

    move/from16 v0, v33

    move-object/from16 v1, v32

    iput-boolean v0, v1, Lcom/disney/emagine/sdk/EMTFileTransfer;->transferAccepted:Z

    .line 2169
    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 2171
    invoke-direct/range {p0 .. p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendMessage()V

    goto/16 :goto_0

    .line 2131
    .restart local v4    # "acceptCRC":J
    .restart local v9    # "crc32":Ljava/util/zip/CRC32;
    .restart local v22    # "offset":J
    :catch_0
    move-exception v14

    .line 2132
    .local v14, "e":Ljava/lang/Exception;
    :try_start_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v32, v0

    sget-object v33, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "Error: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual {v14}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v32 .. v34}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 2155
    .end local v14    # "e":Ljava/lang/Exception;
    .restart local v6    # "calculatedCRC":J
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    const-wide/16 v34, 0x0

    move-wide/from16 v0, v34

    move-object/from16 v2, v32

    iput-wide v0, v2, Lcom/disney/emagine/sdk/EMTFileTransfer;->offset:J

    .line 2156
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    const-wide/16 v34, 0x0

    move-wide/from16 v0, v34

    move-object/from16 v2, v32

    iput-wide v0, v2, Lcom/disney/emagine/sdk/EMTFileTransfer;->resetOffset:J

    .line 2157
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    iget-byte v0, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->flags:B

    move/from16 v33, v0

    or-int/lit8 v33, v33, 0x4

    move/from16 v0, v33

    int-to-byte v0, v0

    move/from16 v33, v0

    move/from16 v0, v33

    move-object/from16 v1, v32

    iput-byte v0, v1, Lcom/disney/emagine/sdk/EMTFileTransfer;->flags:B

    .line 2159
    invoke-direct/range {p0 .. p1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->swapAddressForMessage(Lcom/disney/emagine/sdk/EMTMessage;)V

    .line 2161
    invoke-virtual/range {p0 .. p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->resendFileTransferStart()V

    .line 2162
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    goto/16 :goto_0

    .line 2178
    .end local v4    # "acceptCRC":J
    .end local v6    # "calculatedCRC":J
    .end local v9    # "crc32":Ljava/util/zip/CRC32;
    .end local v22    # "offset":J
    :sswitch_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v33, v0

    sget-object v34, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    sget-object v35, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v36, "RECIEVE <----- FILE_TRANSFER_RESET (offset = %d)"

    const/16 v32, 0x1

    move/from16 v0, v32

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v37, v0

    const/16 v38, 0x0

    const-string v32, "offset"

    move-object/from16 v0, v32

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Ljava/lang/Long;

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Long;->longValue()J

    move-result-wide v40

    invoke-static/range {v40 .. v41}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v32

    aput-object v32, v37, v38

    invoke-static/range {v35 .. v37}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v33

    move-object/from16 v1, v34

    move-object/from16 v2, v32

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2180
    const-string v32, "offset"

    move-object/from16 v0, v32

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Ljava/lang/Long;

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Long;->longValue()J

    move-result-wide v22

    .line 2182
    .restart local v22    # "offset":J
    move-object/from16 v0, p0

    move-wide/from16 v1, v22

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/ble/EMTDevice;->initializeReset(J)V

    .line 2185
    invoke-direct/range {p0 .. p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendMessage()V

    goto/16 :goto_0

    .line 2191
    .end local v22    # "offset":J
    :sswitch_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v32, v0

    sget-object v33, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "RECIEVE <----- FILE_TRANSFER_DATA - opcode("

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, ")"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v32 .. v34}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2193
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->incomingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v33, v0

    monitor-enter v33

    .line 2195
    :try_start_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->incomingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    if-nez v32, :cond_9

    .line 2197
    new-instance v15, Lcom/disney/emagine/sdk/apple/NSError;

    const-string v32, "com.disney.eMagine"

    const/16 v34, 0x6

    const-string v35, "Received a data block with no file in flight."

    move-object/from16 v0, v32

    move/from16 v1, v34

    move-object/from16 v2, v35

    invoke-direct {v15, v0, v1, v2}, Lcom/disney/emagine/sdk/apple/NSError;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 2199
    .restart local v15    # "error":Lcom/disney/emagine/sdk/apple/NSError;
    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceDidExperienceProtocolError(Lcom/disney/emagine/sdk/apple/NSError;)V

    .line 2201
    monitor-exit v33

    goto/16 :goto_0

    .line 2203
    .end local v15    # "error":Lcom/disney/emagine/sdk/apple/NSError;
    :catchall_3
    move-exception v32

    monitor-exit v33
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    throw v32

    :cond_9
    :try_start_9
    monitor-exit v33
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    .line 2205
    const-string v32, "data"

    move-object/from16 v0, v32

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, [B

    move-object/from16 v12, v32

    check-cast v12, [B

    .line 2206
    .local v12, "data":[B
    const-string v32, "offset"

    move-object/from16 v0, v32

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/Long;

    .line 2208
    .local v22, "offset":Ljava/lang/Long;
    invoke-direct/range {p0 .. p1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->swapAddressForMessage(Lcom/disney/emagine/sdk/EMTMessage;)V

    .line 2210
    invoke-virtual/range {v22 .. v22}, Ljava/lang/Long;->longValue()J

    move-result-wide v32

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->incomingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v34, v0

    move-object/from16 v0, v34

    iget-object v0, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->contents:[B

    move-object/from16 v34, v0

    move-object/from16 v0, v34

    array-length v0, v0

    move/from16 v34, v0

    move/from16 v0, v34

    int-to-long v0, v0

    move-wide/from16 v34, v0

    cmp-long v32, v32, v34

    if-eqz v32, :cond_a

    .line 2213
    new-instance v25, Ljava/util/HashMap;

    invoke-direct/range {v25 .. v25}, Ljava/util/HashMap;-><init>()V

    .line 2215
    .local v25, "parameters":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v32, "offset"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->incomingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v33, v0

    move-object/from16 v0, v33

    iget-object v0, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->contents:[B

    move-object/from16 v33, v0

    move-object/from16 v0, v33

    array-length v0, v0

    move/from16 v33, v0

    move/from16 v0, v33

    int-to-long v0, v0

    move-wide/from16 v34, v0

    invoke-static/range {v34 .. v35}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v33

    move-object/from16 v0, v25

    move-object/from16 v1, v32

    move-object/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2217
    const/16 v32, 0x4001

    move-object/from16 v0, p0

    move/from16 v1, v32

    move-object/from16 v2, p1

    move-object/from16 v3, v25

    invoke-direct {v0, v1, v2, v3}, Lcom/disney/emagine/sdk/ble/EMTDevice;->encodeAndSendOperation(SLcom/disney/emagine/sdk/EMTMessage;Ljava/util/HashMap;)Z

    goto/16 :goto_0

    .line 2221
    .end local v25    # "parameters":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->incomingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->incomingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v33, v0

    move-object/from16 v0, v33

    iget-object v0, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->contents:[B

    move-object/from16 v33, v0

    move-object/from16 v0, v33

    invoke-static {v0, v12}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, v32

    iput-object v0, v1, Lcom/disney/emagine/sdk/EMTFileTransfer;->contents:[B

    .line 2223
    if-eqz v12, :cond_c

    .line 2225
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v32, v0

    sget-object v33, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    sget-object v34, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v35, "incomingTransfer.contents length = %d, data length = %d"

    const/16 v36, 0x2

    move/from16 v0, v36

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->incomingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v38, v0

    move-object/from16 v0, v38

    iget-object v0, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->contents:[B

    move-object/from16 v38, v0

    move-object/from16 v0, v38

    array-length v0, v0

    move/from16 v38, v0

    invoke-static/range {v38 .. v38}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v38

    aput-object v38, v36, v37

    const/16 v37, 0x1

    array-length v0, v12

    move/from16 v38, v0

    invoke-static/range {v38 .. v38}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v38

    aput-object v38, v36, v37

    invoke-static/range {v34 .. v36}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v32 .. v34}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2232
    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->incomingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    iget-object v0, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->contents:[B

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    array-length v0, v0

    move/from16 v32, v0

    move/from16 v0, v32

    int-to-long v0, v0

    move-wide/from16 v32, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->incomingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v34, v0

    move-object/from16 v0, v34

    iget-wide v0, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->expectedLength:J

    move-wide/from16 v34, v0

    cmp-long v32, v32, v34

    if-nez v32, :cond_d

    const/16 v16, 0x1

    .line 2234
    .local v16, "finished":Z
    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->incomingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    iget-object v0, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->extras:Ljava/util/HashMap;

    move-object/from16 v32, v0

    const-string v33, "completion"

    invoke-virtual/range {v32 .. v33}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;

    .line 2236
    .local v8, "completion":Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;
    if-eqz v16, :cond_e

    .line 2238
    new-instance v9, Ljava/util/zip/CRC32;

    invoke-direct {v9}, Ljava/util/zip/CRC32;-><init>()V

    .line 2240
    .restart local v9    # "crc32":Ljava/util/zip/CRC32;
    invoke-virtual {v9}, Ljava/util/zip/CRC32;->reset()V

    .line 2241
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->incomingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    iget-object v0, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->contents:[B

    move-object/from16 v32, v0

    const/16 v33, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->incomingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v34, v0

    move-object/from16 v0, v34

    iget-object v0, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->contents:[B

    move-object/from16 v34, v0

    move-object/from16 v0, v34

    array-length v0, v0

    move/from16 v34, v0

    move-object/from16 v0, v32

    move/from16 v1, v33

    move/from16 v2, v34

    invoke-virtual {v9, v0, v1, v2}, Ljava/util/zip/CRC32;->update([BII)V

    .line 2243
    invoke-virtual {v9}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v10

    .line 2245
    .local v10, "crc":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->incomingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    iget-wide v0, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->crc32:J

    move-wide/from16 v32, v0

    cmp-long v32, v10, v32

    if-nez v32, :cond_b

    .line 2247
    new-instance v25, Ljava/util/HashMap;

    invoke-direct/range {v25 .. v25}, Ljava/util/HashMap;-><init>()V

    .line 2248
    .restart local v25    # "parameters":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/16 v32, 0x4003

    move-object/from16 v0, p0

    move/from16 v1, v32

    move-object/from16 v2, p1

    move-object/from16 v3, v25

    invoke-direct {v0, v1, v2, v3}, Lcom/disney/emagine/sdk/ble/EMTDevice;->encodeAndSendOperation(SLcom/disney/emagine/sdk/EMTMessage;Ljava/util/HashMap;)Z

    .line 2250
    if-eqz v8, :cond_b

    .line 2252
    const/16 v32, 0x0

    const/16 v33, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->incomingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v34, v0

    move-object/from16 v0, v34

    iget-object v0, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->contents:[B

    move-object/from16 v34, v0

    move-object/from16 v0, v32

    move/from16 v1, v33

    move-object/from16 v2, v34

    invoke-virtual {v8, v0, v1, v2}, Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;->run(Lcom/disney/emagine/sdk/apple/NSError;Z[B)V

    .line 2256
    .end local v25    # "parameters":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_b
    const/16 v32, 0x0

    move-object/from16 v0, v32

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->incomingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    goto/16 :goto_0

    .line 2229
    .end local v8    # "completion":Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;
    .end local v9    # "crc32":Ljava/util/zip/CRC32;
    .end local v10    # "crc":J
    .end local v16    # "finished":Z
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v32, v0

    sget-object v33, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    sget-object v34, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v35, "incomingTransfer.contents length = %d, data <null>"

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->incomingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v38, v0

    move-object/from16 v0, v38

    iget-object v0, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->contents:[B

    move-object/from16 v38, v0

    move-object/from16 v0, v38

    array-length v0, v0

    move/from16 v38, v0

    invoke-static/range {v38 .. v38}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v38

    aput-object v38, v36, v37

    invoke-static/range {v34 .. v36}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v32 .. v34}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3

    .line 2232
    :cond_d
    const/16 v16, 0x0

    goto/16 :goto_4

    .line 2260
    .restart local v8    # "completion":Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;
    .restart local v16    # "finished":Z
    :cond_e
    if-eqz v8, :cond_0

    .line 2262
    const/16 v32, 0x0

    const/16 v33, 0x0

    move-object/from16 v0, v32

    move/from16 v1, v33

    invoke-virtual {v8, v0, v1, v12}, Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;->run(Lcom/disney/emagine/sdk/apple/NSError;Z[B)V

    goto/16 :goto_0

    .line 2272
    .end local v8    # "completion":Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;
    .end local v12    # "data":[B
    .end local v16    # "finished":Z
    .end local v22    # "offset":Ljava/lang/Long;
    :sswitch_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v32, v0

    sget-object v33, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "RECIEVE <----- FILE_TRANSFER_ACK - opcode("

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, ")"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v32 .. v34}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2274
    const/16 v32, 0x0

    move/from16 v0, v32

    move-object/from16 v1, p0

    iput v0, v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->retryCount:I

    .line 2276
    monitor-enter p0

    .line 2278
    :try_start_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    if-eqz v32, :cond_f

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    iget-object v0, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->contents:[B

    move-object/from16 v32, v0

    if-nez v32, :cond_10

    .line 2280
    :cond_f
    new-instance v15, Lcom/disney/emagine/sdk/apple/NSError;

    const-string v32, "com.disney.eMagine"

    const/16 v33, 0x6

    const-string v34, "Received an ACK with no file in flight."

    move-object/from16 v0, v32

    move/from16 v1, v33

    move-object/from16 v2, v34

    invoke-direct {v15, v0, v1, v2}, Lcom/disney/emagine/sdk/apple/NSError;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 2281
    .restart local v15    # "error":Lcom/disney/emagine/sdk/apple/NSError;
    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceDidExperienceProtocolError(Lcom/disney/emagine/sdk/apple/NSError;)V

    .line 2282
    monitor-exit p0

    goto/16 :goto_0

    .line 2309
    .end local v15    # "error":Lcom/disney/emagine/sdk/apple/NSError;
    :catchall_4
    move-exception v32

    monitor-exit p0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    throw v32

    .line 2285
    :cond_10
    :try_start_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    iget-object v0, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->contents:[B

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    array-length v0, v0

    move/from16 v32, v0

    move/from16 v0, v32

    int-to-long v0, v0

    move-wide/from16 v32, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v34, v0

    move-object/from16 v0, v34

    iget-wide v0, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->previousOffset:J

    move-wide/from16 v34, v0

    sub-long v22, v32, v34

    .line 2287
    .local v22, "offset":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->watchDogTimer:Ljava/util/Timer;

    move-object/from16 v32, v0

    if-eqz v32, :cond_11

    .line 2289
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v32, v0

    sget-object v33, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v34, "FILE_TRANSFER_ACK - being cancelled."

    invoke-virtual/range {v32 .. v34}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2291
    invoke-virtual/range {p0 .. p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->cancelWatchDogTimer()V

    .line 2294
    :cond_11
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->ackTimer:Ljava/util/Timer;

    move-object/from16 v32, v0

    if-eqz v32, :cond_12

    .line 2296
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v32, v0

    sget-object v33, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v34, "ACK_TIMER - cancelled."

    invoke-virtual/range {v32 .. v34}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2298
    const/16 v32, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->cancelAckTimerAndResetRetry(Z)V

    .line 2301
    :cond_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    iget-object v0, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->extras:Ljava/util/HashMap;

    move-object/from16 v32, v0

    const-string v33, "completion"

    invoke-virtual/range {v32 .. v33}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/disney/emagine/sdk/delegate/EMTTransferDelegate;

    .line 2303
    .local v8, "completion":Lcom/disney/emagine/sdk/delegate/EMTTransferDelegate;
    const/16 v32, 0x0

    move-object/from16 v0, v32

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    .line 2305
    if-eqz v8, :cond_13

    .line 2307
    const/16 v32, 0x0

    const/16 v33, 0x1

    move-wide/from16 v0, v22

    long-to-int v0, v0

    move/from16 v34, v0

    move-object/from16 v0, v32

    move/from16 v1, v33

    move/from16 v2, v34

    invoke-interface {v8, v0, v1, v2}, Lcom/disney/emagine/sdk/delegate/EMTTransferDelegate;->run(Lcom/disney/emagine/sdk/apple/NSError;ZI)V

    .line 2309
    :cond_13
    monitor-exit p0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    goto/16 :goto_0

    .line 2316
    .end local v8    # "completion":Lcom/disney/emagine/sdk/delegate/EMTTransferDelegate;
    .end local v22    # "offset":J
    :sswitch_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v32, v0

    sget-object v33, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "RECIEVE <----- FILE_TRANSFER_NACK - opcode("

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, ")"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v32 .. v34}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2318
    move-object/from16 v0, p0

    iget v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->retryCount:I

    move/from16 v32, v0

    add-int/lit8 v33, v32, 0x1

    move/from16 v0, v33

    move-object/from16 v1, p0

    iput v0, v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->retryCount:I

    const/16 v33, 0x3

    move/from16 v0, v32

    move/from16 v1, v33

    if-lt v0, v1, :cond_15

    .line 2320
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    iget-object v0, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->extras:Ljava/util/HashMap;

    move-object/from16 v32, v0

    const-string v33, "completion"

    invoke-virtual/range {v32 .. v33}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/disney/emagine/sdk/delegate/EMTTransferDelegate;

    .line 2322
    .restart local v8    # "completion":Lcom/disney/emagine/sdk/delegate/EMTTransferDelegate;
    if-eqz v8, :cond_14

    .line 2324
    new-instance v15, Lcom/disney/emagine/sdk/apple/NSError;

    const-string v32, "com.disney.eMagine"

    const/16 v33, 0xc

    const-string v34, "Failed to tranfer file."

    move-object/from16 v0, v32

    move/from16 v1, v33

    move-object/from16 v2, v34

    invoke-direct {v15, v0, v1, v2}, Lcom/disney/emagine/sdk/apple/NSError;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 2325
    .restart local v15    # "error":Lcom/disney/emagine/sdk/apple/NSError;
    const/16 v32, 0x1

    const/16 v33, 0x0

    move/from16 v0, v32

    move/from16 v1, v33

    invoke-interface {v8, v15, v0, v1}, Lcom/disney/emagine/sdk/delegate/EMTTransferDelegate;->run(Lcom/disney/emagine/sdk/apple/NSError;ZI)V

    .line 2328
    .end local v15    # "error":Lcom/disney/emagine/sdk/apple/NSError;
    :cond_14
    const/16 v32, 0x0

    move/from16 v0, v32

    move-object/from16 v1, p0

    iput v0, v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->retryCount:I

    goto/16 :goto_0

    .line 2332
    .end local v8    # "completion":Lcom/disney/emagine/sdk/delegate/EMTTransferDelegate;
    :cond_15
    monitor-enter p0

    .line 2334
    :try_start_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    if-nez v32, :cond_16

    .line 2336
    new-instance v15, Lcom/disney/emagine/sdk/apple/NSError;

    const-string v32, "com.disney.eMagine"

    const/16 v33, 0x6

    const-string v34, "Received a NACK with no file in flight."

    move-object/from16 v0, v32

    move/from16 v1, v33

    move-object/from16 v2, v34

    invoke-direct {v15, v0, v1, v2}, Lcom/disney/emagine/sdk/apple/NSError;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 2337
    .restart local v15    # "error":Lcom/disney/emagine/sdk/apple/NSError;
    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceDidExperienceProtocolError(Lcom/disney/emagine/sdk/apple/NSError;)V

    .line 2338
    monitor-exit p0

    goto/16 :goto_0

    .line 2357
    .end local v15    # "error":Lcom/disney/emagine/sdk/apple/NSError;
    :catchall_5
    move-exception v32

    monitor-exit p0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_5

    throw v32

    .line 2340
    :cond_16
    :try_start_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    const-wide/16 v34, 0x0

    move-wide/from16 v0, v34

    move-object/from16 v2, v32

    iput-wide v0, v2, Lcom/disney/emagine/sdk/EMTFileTransfer;->offset:J

    .line 2341
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    const-wide/16 v34, 0x0

    move-wide/from16 v0, v34

    move-object/from16 v2, v32

    iput-wide v0, v2, Lcom/disney/emagine/sdk/EMTFileTransfer;->previousOffset:J

    .line 2342
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    const-wide/16 v34, 0x0

    move-wide/from16 v0, v34

    move-object/from16 v2, v32

    iput-wide v0, v2, Lcom/disney/emagine/sdk/EMTFileTransfer;->headerLength:J

    .line 2343
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    const/16 v33, 0x0

    move/from16 v0, v33

    move-object/from16 v1, v32

    iput v0, v1, Lcom/disney/emagine/sdk/EMTFileTransfer;->packetSize:I

    .line 2344
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    iget-byte v0, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->flags:B

    move/from16 v33, v0

    or-int/lit8 v33, v33, 0x1

    move/from16 v0, v33

    int-to-byte v0, v0

    move/from16 v33, v0

    move/from16 v0, v33

    move-object/from16 v1, v32

    iput-byte v0, v1, Lcom/disney/emagine/sdk/EMTFileTransfer;->flags:B

    .line 2345
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    iget-byte v0, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->flags:B

    move/from16 v33, v0

    and-int/lit8 v33, v33, -0x5

    move/from16 v0, v33

    int-to-byte v0, v0

    move/from16 v33, v0

    move/from16 v0, v33

    move-object/from16 v1, v32

    iput-byte v0, v1, Lcom/disney/emagine/sdk/EMTFileTransfer;->flags:B

    .line 2346
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    const/16 v33, 0x0

    move/from16 v0, v33

    move-object/from16 v1, v32

    iput-boolean v0, v1, Lcom/disney/emagine/sdk/EMTFileTransfer;->transferAccepted:Z

    .line 2347
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->frameCounter:I

    move/from16 v33, v0

    move/from16 v0, v33

    int-to-long v0, v0

    move-wide/from16 v34, v0

    move-wide/from16 v0, v34

    move-object/from16 v2, v32

    iput-wide v0, v2, Lcom/disney/emagine/sdk/EMTFileTransfer;->lastAckedFrameCounter:J

    .line 2349
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    iget-byte v0, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->flags:B

    move/from16 v32, v0

    and-int/lit8 v32, v32, 0x2

    if-eqz v32, :cond_17

    .line 2351
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v33, v0

    move-object/from16 v0, v33

    iget-object v0, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->uncompressedContents:[B

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Lcom/disney/emagine/sdk/zip/EMTCompressor;->compressSource([B)[B

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, v32

    iput-object v0, v1, Lcom/disney/emagine/sdk/EMTFileTransfer;->contents:[B

    .line 2356
    :goto_5
    invoke-virtual/range {p0 .. p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->resendFileTransferStart()V

    .line 2357
    monitor-exit p0

    goto/16 :goto_0

    .line 2353
    :cond_17
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v33, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    iget-object v0, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->uncompressedContents:[B

    move-object/from16 v32, v0

    invoke-virtual/range {v32 .. v32}, [B->clone()Ljava/lang/Object;

    move-result-object v32

    check-cast v32, [B

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    iput-object v0, v1, Lcom/disney/emagine/sdk/EMTFileTransfer;->contents:[B
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_5

    goto :goto_5

    .line 2365
    :sswitch_9
    const-string v32, "frame_counter"

    move-object/from16 v0, v32

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Ljava/lang/Integer;

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Integer;->intValue()I

    move-result v17

    .line 2367
    .local v17, "frameCounter":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v32, v0

    sget-object v33, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v34, "RECEIVE <------ MESSAGE_ACK(FRAME COUNTER: %d)"

    const/16 v35, 0x1

    move/from16 v0, v35

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v35, v0

    const/16 v36, 0x0

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v37

    aput-object v37, v35, v36

    invoke-static/range {v34 .. v35}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v32 .. v34}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2369
    invoke-virtual/range {p0 .. p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->resetWatchDogTimer()V

    .line 2370
    const/16 v32, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->cancelAckTimerAndResetRetry(Z)V

    .line 2372
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    if-eqz v32, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    iget-boolean v0, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->transferAccepted:Z

    move/from16 v32, v0

    const/16 v33, 0x1

    move/from16 v0, v32

    move/from16 v1, v33

    if-ne v0, v1, :cond_0

    .line 2374
    monitor-enter p0

    .line 2377
    :try_start_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v32, v0

    move/from16 v0, v17

    int-to-long v0, v0

    move-wide/from16 v34, v0

    move-wide/from16 v0, v34

    move-object/from16 v2, v32

    iput-wide v0, v2, Lcom/disney/emagine/sdk/EMTFileTransfer;->lastAckedFrameCounter:J

    .line 2378
    invoke-direct/range {p0 .. p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendMessage()V

    .line 2379
    monitor-exit p0

    goto/16 :goto_0

    :catchall_6
    move-exception v32

    monitor-exit p0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_6

    throw v32

    .line 2387
    .end local v17    # "frameCounter":I
    :sswitch_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v32, v0

    sget-object v33, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    sget-object v34, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v35, "RECEIVE <------ PACKET_NACK"

    const/16 v36, 0x0

    move/from16 v0, v36

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v36, v0

    invoke-static/range {v34 .. v36}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v32 .. v34}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2389
    const/16 v32, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->cancelAckTimerAndResetRetry(Z)V

    .line 2390
    invoke-virtual/range {p0 .. p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->resetWatchDogTimer()V

    .line 2392
    invoke-direct/range {p0 .. p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->resendMessage()V

    goto/16 :goto_0

    .line 2399
    :sswitch_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v32, v0

    sget-object v33, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    sget-object v34, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v35, "RECEIVE <------ CUSTOM_LUA_EVENT"

    const/16 v36, 0x0

    move/from16 v0, v36

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v36, v0

    invoke-static/range {v34 .. v36}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v32 .. v34}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2400
    const-string v32, "payload"

    move-object/from16 v0, v32

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, [B

    move-object/from16 v26, v32

    check-cast v26, [B

    .line 2402
    .local v26, "payload":[B
    invoke-direct/range {p0 .. p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->isRadioAddressAvailable()Z

    move-result v32

    if-eqz v32, :cond_19

    if-eqz v26, :cond_19

    .line 2404
    const/16 v32, 0x6

    const/16 v33, 0x7

    move-object/from16 v0, v26

    move/from16 v1, v32

    move/from16 v2, v33

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v32

    const/16 v33, 0x0

    aget-byte v30, v32, v33

    .line 2405
    .local v30, "verWords":B
    and-int/lit8 v32, v30, 0xf

    move/from16 v0, v32

    int-to-byte v0, v0

    move/from16 v31, v0

    .line 2407
    .local v31, "version":B
    if-nez v31, :cond_18

    .line 2409
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v32

    move-object/from16 v0, v32

    move-object/from16 v1, p0

    move-object/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->deviceDidReceiveSimplePayload(Lcom/disney/emagine/sdk/ble/EMTDevice;[B)V

    goto/16 :goto_0

    .line 2413
    :cond_18
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v32

    move-object/from16 v0, v32

    move-object/from16 v1, p0

    move-object/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->deviceDidReceiveComplexPayload(Lcom/disney/emagine/sdk/ble/EMTDevice;[B)V

    goto/16 :goto_0

    .line 2418
    .end local v30    # "verWords":B
    .end local v31    # "version":B
    :cond_19
    if-nez v26, :cond_1a

    .line 2419
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v32, v0

    sget-object v33, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v34, "Error processing custom LUA event: the custom Lua event is missing a payload"

    invoke-virtual/range {v32 .. v34}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2422
    :cond_1a
    invoke-direct/range {p0 .. p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->isRadioAddressAvailable()Z

    move-result v32

    if-nez v32, :cond_0

    .line 2423
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v32, v0

    sget-object v33, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v34, "Error processing custom LUA event: the radio address isn\'t available yet (e.g. not scanned)"

    invoke-virtual/range {v32 .. v34}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2432
    .end local v26    # "payload":[B
    :sswitch_c
    const-string v32, "payload"

    move-object/from16 v0, v32

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, [B

    move-object/from16 v26, v32

    check-cast v26, [B

    .line 2434
    .restart local v26    # "payload":[B
    if-eqz v26, :cond_1d

    .line 2436
    const/16 v32, 0x0

    const/16 v33, 0x4

    move-object/from16 v0, v26

    move/from16 v1, v32

    move/from16 v2, v33

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v32

    invoke-static/range {v32 .. v32}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v32

    invoke-static/range {v32 .. v32}, Lcom/disney/emagine/sdk/EMTData;->uintBytesToLong([B)J

    move-result-wide v28

    .line 2438
    .local v28, "toAddress":J
    const-wide v32, 0xfffffffeL

    cmp-long v32, v28, v32

    if-eqz v32, :cond_1b

    const-wide v32, 0xfffffffdL

    cmp-long v32, v28, v32

    if-nez v32, :cond_1c

    .line 2441
    :cond_1b
    const/16 v32, 0x4

    const/16 v33, 0x8

    move-object/from16 v0, v26

    move/from16 v1, v32

    move/from16 v2, v33

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v32

    invoke-static/range {v32 .. v32}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v32

    invoke-static/range {v32 .. v32}, Lcom/disney/emagine/sdk/EMTData;->uintBytesToLongObject([B)Ljava/lang/Long;

    move-result-object v18

    .line 2442
    .local v18, "fromAddress":Ljava/lang/Long;
    move-object/from16 v0, p1

    iget v0, v0, Lcom/disney/emagine/sdk/EMTMessage;->senderAddress:I

    move/from16 v32, v0

    move/from16 v0, v32

    int-to-long v0, v0

    move-wide/from16 v32, v0

    invoke-static/range {v32 .. v33}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v27

    .line 2444
    .local v27, "senderAddress":Ljava/lang/Long;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceIDToRadioID:Ljava/util/HashMap;

    move-object/from16 v33, v0

    monitor-enter v33

    .line 2446
    :try_start_f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceIDToRadioID:Ljava/util/HashMap;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    move-object/from16 v1, v18

    move-object/from16 v2, v27

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2447
    monitor-exit v33
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_7

    .line 2450
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->controller:Lcom/disney/emagine/sdk/ble/EMTController;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    move-object/from16 v1, p0

    move-object/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/ble/EMTController;->deviceDidReceiveImHere(Lcom/disney/emagine/sdk/ble/EMTDevice;[B)V

    .line 2459
    .end local v18    # "fromAddress":Ljava/lang/Long;
    .end local v27    # "senderAddress":Ljava/lang/Long;
    :goto_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->controller:Lcom/disney/emagine/sdk/ble/EMTController;

    move-object/from16 v32, v0

    const/16 v33, 0x6

    new-instance v34, Lcom/disney/emagine/sdk/ble/EMTDevice$EMTDeviceMessage;

    const/16 v35, 0x0

    move-object/from16 v0, v34

    move-object/from16 v1, p0

    move-object/from16 v2, v35

    move-object/from16 v3, v26

    invoke-direct {v0, v1, v2, v3}, Lcom/disney/emagine/sdk/ble/EMTDevice$EMTDeviceMessage;-><init>(Lcom/disney/emagine/sdk/ble/EMTDevice;Lcom/disney/emagine/sdk/apple/NSError;[B)V

    invoke-virtual/range {v32 .. v34}, Lcom/disney/emagine/sdk/ble/EMTController;->postToHandler(ILcom/disney/emagine/sdk/ble/EMTDevice$EMTDeviceMessage;)V

    goto/16 :goto_0

    .line 2447
    .restart local v18    # "fromAddress":Ljava/lang/Long;
    .restart local v27    # "senderAddress":Ljava/lang/Long;
    :catchall_7
    move-exception v32

    :try_start_10
    monitor-exit v33
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_7

    throw v32

    .line 2456
    .end local v18    # "fromAddress":Ljava/lang/Long;
    .end local v27    # "senderAddress":Ljava/lang/Long;
    :cond_1c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v32, v0

    sget-object v33, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "ROUTED_BROADCAST_EVENT, toAddress = "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-wide/from16 v1, v28

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v32 .. v34}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_6

    .line 2463
    .end local v28    # "toAddress":J
    :cond_1d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v32, v0

    sget-object v33, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v34, "Error, ROUTED_BROADCAST_EVENT is missing a payload"

    invoke-virtual/range {v32 .. v34}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2472
    .end local v26    # "payload":[B
    :sswitch_d
    const-string v32, "nonce"

    move-object/from16 v0, v32

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, [B

    move-object/from16 v20, v32

    check-cast v20, [B

    .line 2474
    .local v20, "nonce":[B
    if-eqz v20, :cond_0

    .line 2476
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v32, v0

    sget-object v33, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "The Nonce received = "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-static/range {v20 .. v20}, Lcom/disney/emagine/sdk/EMTData;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v32 .. v34}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2478
    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->toySessionNonce:[B

    .line 2480
    invoke-virtual/range {p0 .. p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->respondWithNonce()V

    goto/16 :goto_0

    .line 1998
    nop

    :sswitch_data_0
    .sparse-switch
        0x3fff -> :sswitch_3
        0x4000 -> :sswitch_4
        0x4001 -> :sswitch_5
        0x4002 -> :sswitch_6
        0x4003 -> :sswitch_7
        0x4004 -> :sswitch_8
        0x4005 -> :sswitch_0
        0x4006 -> :sswitch_1
        0x400b -> :sswitch_2
        0x400c -> :sswitch_d
        0x6050 -> :sswitch_a
        0x6051 -> :sswitch_9
        0xfffd -> :sswitch_b
        0xfffe -> :sswitch_c
    .end sparse-switch
.end method

.method private radioIDFromDeviceID(J)J
    .locals 5
    .param p1, "deviceID"    # J

    .prologue
    .line 799
    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceIDToRadioID:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    .line 801
    .local v0, "radioAddress":Ljava/lang/Long;
    if-nez v0, :cond_0

    .line 803
    const-wide/16 v2, 0x0

    .line 806
    :goto_0
    return-wide v2

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    goto :goto_0
.end method

.method private resendMessage()V
    .locals 11

    .prologue
    const-wide/16 v4, 0x0

    const/4 v10, 0x0

    .line 1144
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    if-nez v0, :cond_0

    .line 1146
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v2, "Exiting out since no longer transfering"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1179
    :goto_0
    return-void

    .line 1151
    :cond_0
    monitor-enter p0

    .line 1153
    :try_start_0
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-wide v0, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->lastAckedFrameCounter:J

    iget v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->frameCounter:I

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-eqz v0, :cond_2

    .line 1156
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-wide v0, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->offset:J

    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget v2, v2, Lcom/disney/emagine/sdk/EMTFileTransfer;->packetSize:I

    int-to-long v2, v2

    sub-long/2addr v0, v2

    cmp-long v0, v0, v4

    if-lez v0, :cond_1

    .line 1158
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-wide v2, v1, Lcom/disney/emagine/sdk/EMTFileTransfer;->offset:J

    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget v1, v1, Lcom/disney/emagine/sdk/EMTFileTransfer;->packetSize:I

    int-to-long v4, v1

    sub-long/2addr v2, v4

    iput-wide v2, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->offset:J

    .line 1166
    :goto_1
    iget v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->frameCounter:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->frameCounter:I

    .line 1168
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v2, "Resend message with index (%d)"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-wide v6, v5, Lcom/disney/emagine/sdk/EMTFileTransfer;->offset:J

    iget-object v5, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-wide v8, v5, Lcom/disney/emagine/sdk/EMTFileTransfer;->resetOffset:J

    add-long/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1174
    :goto_2
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1176
    iput-boolean v10, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->waitingForACK:Z

    .line 1178
    invoke-direct {p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendMessage()V

    goto :goto_0

    .line 1162
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    const-wide/16 v2, 0x0

    iput-wide v2, v0, Lcom/disney/emagine/sdk/EMTFileTransfer;->offset:J

    goto :goto_1

    .line 1174
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 1172
    :cond_2
    :try_start_2
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v2, "Skip resend for [%d], since it has been ACKed since the resend was scheduled"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget v5, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->frameCounter:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2
.end method

.method private sendCustomLuaEvent(Lcom/disney/emagine/sdk/EMTMessage;)V
    .locals 2
    .param p1, "message"    # Lcom/disney/emagine/sdk/EMTMessage;

    .prologue
    .line 761
    const/4 v0, -0x3

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->encodeAndSendOperation(SLcom/disney/emagine/sdk/EMTMessage;Ljava/util/HashMap;)Z

    .line 762
    return-void
.end method

.method private sendMessage()V
    .locals 20

    .prologue
    .line 1186
    monitor-enter p0

    .line 1188
    :try_start_0
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    if-eqz v10, :cond_0

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget v10, v10, Lcom/disney/emagine/sdk/EMTFileTransfer;->packetSize:I

    if-nez v10, :cond_1

    .line 1190
    :cond_0
    monitor-exit p0

    .line 1246
    :goto_0
    return-void

    .line 1194
    :cond_1
    const/4 v10, 0x0

    move-object/from16 v0, p0

    iput-boolean v10, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->waitingForACK:Z

    .line 1197
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-wide v10, v10, Lcom/disney/emagine/sdk/EMTFileTransfer;->offset:J

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-object v12, v12, Lcom/disney/emagine/sdk/EMTFileTransfer;->contents:[B

    array-length v12, v12

    int-to-long v12, v12

    cmp-long v10, v10, v12

    if-ltz v10, :cond_2

    .line 1199
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v11, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v12, "sendMessage: offset(%d) is larger than content length(%d), exiting out."

    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-wide v0, v15, Lcom/disney/emagine/sdk/EMTFileTransfer;->offset:J

    move-wide/from16 v16, v0

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v15

    aput-object v15, v13, v14

    const/4 v14, 0x1

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-object v15, v15, Lcom/disney/emagine/sdk/EMTFileTransfer;->contents:[B

    array-length v15, v15

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-static {v12, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v11, v12}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1201
    monitor-exit p0

    goto :goto_0

    .line 1245
    :catchall_0
    move-exception v10

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v10

    .line 1204
    :cond_2
    :try_start_1
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v11, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v12, "sendMessage message with index (%d)"

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-wide v0, v15, Lcom/disney/emagine/sdk/EMTFileTransfer;->offset:J

    move-wide/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-wide v0, v15, Lcom/disney/emagine/sdk/EMTFileTransfer;->resetOffset:J

    move-wide/from16 v18, v0

    add-long v16, v16, v18

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-static {v12, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v11, v12}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1206
    new-instance v9, Lcom/disney/emagine/sdk/apple/NSRange;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-wide v10, v10, Lcom/disney/emagine/sdk/EMTFileTransfer;->offset:J

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget v12, v12, Lcom/disney/emagine/sdk/EMTFileTransfer;->packetSize:I

    int-to-long v12, v12

    invoke-direct {v9, v10, v11, v12, v13}, Lcom/disney/emagine/sdk/apple/NSRange;-><init>(JJ)V

    .line 1208
    .local v9, "range":Lcom/disney/emagine/sdk/apple/NSRange;
    iget-wide v10, v9, Lcom/disney/emagine/sdk/apple/NSRange;->location:J

    iget-wide v12, v9, Lcom/disney/emagine/sdk/apple/NSRange;->length:J

    add-long/2addr v10, v12

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-object v12, v12, Lcom/disney/emagine/sdk/EMTFileTransfer;->contents:[B

    array-length v12, v12

    int-to-long v12, v12

    cmp-long v10, v10, v12

    if-ltz v10, :cond_3

    .line 1210
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-object v10, v10, Lcom/disney/emagine/sdk/EMTFileTransfer;->contents:[B

    array-length v10, v10

    int-to-long v10, v10

    iget-wide v12, v9, Lcom/disney/emagine/sdk/apple/NSRange;->location:J

    sub-long/2addr v10, v12

    iput-wide v10, v9, Lcom/disney/emagine/sdk/apple/NSRange;->length:J

    .line 1214
    :cond_3
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-object v10, v10, Lcom/disney/emagine/sdk/EMTFileTransfer;->contents:[B

    iget-wide v12, v9, Lcom/disney/emagine/sdk/apple/NSRange;->location:J

    long-to-int v11, v12

    iget-wide v12, v9, Lcom/disney/emagine/sdk/apple/NSRange;->location:J

    iget-wide v14, v9, Lcom/disney/emagine/sdk/apple/NSRange;->length:J

    add-long/2addr v12, v14

    long-to-int v12, v12

    invoke-static {v10, v11, v12}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v3

    .line 1216
    .local v3, "data":[B
    const/4 v10, 0x1

    const/16 v11, 0x4002

    move-object/from16 v0, p0

    invoke-direct {v0, v10, v11}, Lcom/disney/emagine/sdk/ble/EMTDevice;->createMessageForOutgoing(ZI)Lcom/disney/emagine/sdk/EMTMessage;

    move-result-object v7

    .line 1218
    .local v7, "message":Lcom/disney/emagine/sdk/EMTMessage;
    const/4 v6, 0x0

    .line 1220
    .local v6, "flag":B
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-byte v10, v10, Lcom/disney/emagine/sdk/EMTFileTransfer;->flags:B

    and-int/lit8 v10, v10, 0x8

    if-lez v10, :cond_4

    .line 1222
    const/4 v6, 0x1

    .line 1223
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-byte v11, v10, Lcom/disney/emagine/sdk/EMTFileTransfer;->flags:B

    xor-int/lit8 v11, v11, 0x8

    int-to-byte v11, v11

    iput-byte v11, v10, Lcom/disney/emagine/sdk/EMTFileTransfer;->flags:B

    .line 1226
    :cond_4
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 1228
    .local v8, "parameters":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v10, "offset"

    iget-wide v12, v9, Lcom/disney/emagine/sdk/apple/NSRange;->location:J

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-wide v14, v11, Lcom/disney/emagine/sdk/EMTFileTransfer;->resetOffset:J

    add-long/2addr v12, v14

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    invoke-virtual {v8, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1229
    const-string v10, "flag"

    int-to-short v11, v6

    invoke-static {v11}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v11

    invoke-virtual {v8, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1230
    const-string v10, "data"

    invoke-virtual {v8, v10, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1232
    const/16 v10, 0x4002

    move-object/from16 v0, p0

    invoke-direct {v0, v10, v7, v8}, Lcom/disney/emagine/sdk/ble/EMTDevice;->encodeAndSendOperation(SLcom/disney/emagine/sdk/EMTMessage;Ljava/util/HashMap;)Z

    .line 1234
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-wide v12, v9, Lcom/disney/emagine/sdk/apple/NSRange;->location:J

    iget-wide v14, v9, Lcom/disney/emagine/sdk/apple/NSRange;->length:J

    add-long/2addr v12, v14

    iput-wide v12, v10, Lcom/disney/emagine/sdk/EMTFileTransfer;->offset:J

    .line 1236
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-object v10, v10, Lcom/disney/emagine/sdk/EMTFileTransfer;->extras:Ljava/util/HashMap;

    const-string v11, "completion"

    invoke-virtual {v10, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/disney/emagine/sdk/delegate/EMTTransferDelegate;

    .line 1238
    .local v2, "completion":Lcom/disney/emagine/sdk/delegate/EMTTransferDelegate;
    if-eqz v2, :cond_5

    .line 1240
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-wide v10, v10, Lcom/disney/emagine/sdk/EMTFileTransfer;->offset:J

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-wide v12, v12, Lcom/disney/emagine/sdk/EMTFileTransfer;->previousOffset:J

    sub-long v4, v10, v12

    .line 1241
    .local v4, "deltaOffset":J
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-wide v12, v11, Lcom/disney/emagine/sdk/EMTFileTransfer;->offset:J

    iput-wide v12, v10, Lcom/disney/emagine/sdk/EMTFileTransfer;->previousOffset:J

    .line 1243
    const/4 v10, 0x0

    const/4 v11, 0x0

    long-to-int v12, v4

    invoke-interface {v2, v10, v11, v12}, Lcom/disney/emagine/sdk/delegate/EMTTransferDelegate;->run(Lcom/disney/emagine/sdk/apple/NSError;ZI)V

    .line 1245
    .end local v4    # "deltaOffset":J
    :cond_5
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0
.end method

.method private swapAddressForMessage(Lcom/disney/emagine/sdk/EMTMessage;)V
    .locals 2
    .param p1, "message"    # Lcom/disney/emagine/sdk/EMTMessage;

    .prologue
    .line 1973
    iget v0, p1, Lcom/disney/emagine/sdk/EMTMessage;->targetAddress:I

    .line 1975
    .local v0, "tmpAddress":I
    iget v1, p1, Lcom/disney/emagine/sdk/EMTMessage;->senderAddress:I

    iput v1, p1, Lcom/disney/emagine/sdk/EMTMessage;->targetAddress:I

    .line 1976
    iput v0, p1, Lcom/disney/emagine/sdk/EMTMessage;->senderAddress:I

    .line 1977
    return-void
.end method

.method private watchDogTimeout()V
    .locals 14

    .prologue
    const/4 v13, 0x1

    const/4 v12, 0x0

    .line 1333
    iget-boolean v5, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->watchDogDebug:Z

    if-eqz v5, :cond_0

    .line 1334
    iget-object v5, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v6, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v7, "watchDog timeout called."

    invoke-virtual {v5, v6, v7}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1336
    :cond_0
    iget-object v5, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    if-nez v5, :cond_2

    .line 1338
    iput v12, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->retryCount:I

    .line 1367
    :cond_1
    :goto_0
    return-void

    .line 1343
    :cond_2
    iget-object v5, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-object v5, v5, Lcom/disney/emagine/sdk/EMTFileTransfer;->extras:Ljava/util/HashMap;

    const-string v6, "completion"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disney/emagine/sdk/delegate/EMTTransferDelegate;

    .line 1345
    .local v0, "completion":Lcom/disney/emagine/sdk/delegate/EMTTransferDelegate;
    if-eqz v0, :cond_1

    .line 1347
    iget v5, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->retryCount:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->retryCount:I

    const/4 v6, 0x3

    if-ge v5, v6, :cond_3

    .line 1349
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->resendFileTransferStart()V

    goto :goto_0

    .line 1353
    :cond_3
    iput v12, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->retryCount:I

    .line 1354
    new-instance v1, Lcom/disney/emagine/sdk/apple/NSError;

    const-string v5, "com.disney.eMagine"

    const/16 v6, 0xb

    const-string v7, "Transfer timeout"

    invoke-direct {v1, v5, v6, v7}, Lcom/disney/emagine/sdk/apple/NSError;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 1355
    .local v1, "error":Lcom/disney/emagine/sdk/apple/NSError;
    new-instance v4, Lcom/disney/emagine/sdk/apple/NSRange;

    iget-object v5, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-wide v6, v5, Lcom/disney/emagine/sdk/EMTFileTransfer;->offset:J

    iget-object v5, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget v5, v5, Lcom/disney/emagine/sdk/EMTFileTransfer;->packetSize:I

    int-to-long v8, v5

    invoke-direct {v4, v6, v7, v8, v9}, Lcom/disney/emagine/sdk/apple/NSRange;-><init>(JJ)V

    .line 1356
    .local v4, "range":Lcom/disney/emagine/sdk/apple/NSRange;
    iget-wide v6, v4, Lcom/disney/emagine/sdk/apple/NSRange;->location:J

    const-wide/16 v8, 0x64

    mul-long/2addr v6, v8

    iget-object v5, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-object v5, v5, Lcom/disney/emagine/sdk/EMTFileTransfer;->contents:[B

    array-length v5, v5

    int-to-long v8, v5

    div-long/2addr v6, v8

    long-to-double v2, v6

    .line 1357
    .local v2, "percent":D
    const-wide/high16 v6, 0x4059000000000000L    # 100.0

    cmpl-double v5, v2, v6

    if-lez v5, :cond_4

    .line 1358
    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    .line 1361
    :cond_4
    iget-object v5, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v6, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "Percent complete = %.2f, offset = %d"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v10

    aput-object v10, v9, v12

    iget-object v10, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-wide v10, v10, Lcom/disney/emagine/sdk/EMTFileTransfer;->offset:J

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v9, v13

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1363
    invoke-interface {v0, v1, v13, v12}, Lcom/disney/emagine/sdk/delegate/EMTTransferDelegate;->run(Lcom/disney/emagine/sdk/apple/NSError;ZI)V

    .line 1364
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->cancelAndInvalidate()V

    goto :goto_0
.end method


# virtual methods
.method public acceptFile(ZLcom/disney/emagine/sdk/delegate/EMTAcceptCompletionDelegate;)V
    .locals 10
    .param p1, "accepted"    # Z
    .param p2, "completion"    # Lcom/disney/emagine/sdk/delegate/EMTAcceptCompletionDelegate;

    .prologue
    const/16 v9, 0x4000

    const/4 v8, 0x2

    const/4 v4, 0x0

    const/4 v3, 0x1

    const/4 v7, 0x0

    .line 710
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->isReady()Z

    move-result v5

    if-nez v5, :cond_0

    .line 712
    new-instance v4, Lcom/disney/emagine/sdk/apple/NSError;

    const-string v5, "com.disney.eMagine"

    const-string v6, "Device is not connected."

    invoke-direct {v4, v5, v8, v6}, Lcom/disney/emagine/sdk/apple/NSError;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    invoke-interface {p2, v4, v3, v7}, Lcom/disney/emagine/sdk/delegate/EMTAcceptCompletionDelegate;->run(Lcom/disney/emagine/sdk/apple/NSError;Z[B)V

    .line 752
    :goto_0
    return-void

    .line 717
    :cond_0
    iget-object v5, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->incomingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    monitor-enter v5

    .line 719
    :try_start_0
    iget-object v6, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->incomingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    if-nez v6, :cond_1

    .line 721
    new-instance v3, Lcom/disney/emagine/sdk/apple/NSError;

    const-string v4, "com.disney.eMagine"

    const/4 v6, 0x2

    const-string v7, "No pending transfer from device to accept."

    invoke-direct {v3, v4, v6, v7}, Lcom/disney/emagine/sdk/apple/NSError;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    const/4 v4, 0x1

    const/4 v6, 0x0

    invoke-interface {p2, v3, v4, v6}, Lcom/disney/emagine/sdk/delegate/EMTAcceptCompletionDelegate;->run(Lcom/disney/emagine/sdk/apple/NSError;Z[B)V

    .line 723
    monitor-exit v5

    goto :goto_0

    .line 742
    :catchall_0
    move-exception v3

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 726
    :cond_1
    if-nez p1, :cond_3

    .line 728
    const/4 v6, 0x0

    :try_start_1
    iput-object v6, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->incomingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    .line 730
    if-eqz p2, :cond_2

    .line 732
    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    invoke-interface {p2, v6, v7, v8}, Lcom/disney/emagine/sdk/delegate/EMTAcceptCompletionDelegate;->run(Lcom/disney/emagine/sdk/apple/NSError;Z[B)V

    .line 742
    :cond_2
    :goto_1
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 745
    invoke-direct {p0, v4, v9}, Lcom/disney/emagine/sdk/ble/EMTDevice;->createMessageForOutgoing(ZI)Lcom/disney/emagine/sdk/EMTMessage;

    move-result-object v1

    .line 746
    .local v1, "message":Lcom/disney/emagine/sdk/EMTMessage;
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 748
    .local v2, "parameters":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v5, "status"

    if-eqz p1, :cond_4

    :goto_2
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v5, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 749
    const-string v3, "packetMTU"

    const/16 v4, 0x400

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 751
    invoke-direct {p0, v9, v1, v2}, Lcom/disney/emagine/sdk/ble/EMTDevice;->encodeAndSendOperation(SLcom/disney/emagine/sdk/EMTMessage;Ljava/util/HashMap;)Z

    goto :goto_0

    .line 736
    .end local v1    # "message":Lcom/disney/emagine/sdk/EMTMessage;
    .end local v2    # "parameters":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_3
    :try_start_2
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 738
    .local v0, "extras":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v6, "completion"

    invoke-virtual {v0, v6, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 740
    iget-object v6, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->incomingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iput-object v0, v6, Lcom/disney/emagine/sdk/EMTFileTransfer;->extras:Ljava/util/HashMap;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .end local v0    # "extras":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v1    # "message":Lcom/disney/emagine/sdk/EMTMessage;
    .restart local v2    # "parameters":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_4
    move v3, v4

    .line 748
    goto :goto_2
.end method

.method public ackTimeout()V
    .locals 3

    .prologue
    .line 1279
    iget-boolean v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->watchDogDebug:Z

    if-eqz v0, :cond_0

    .line 1280
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v2, "ack timeout called."

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1282
    :cond_0
    iget-byte v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->ackRetryCounter:B

    add-int/lit8 v1, v0, 0x1

    int-to-byte v1, v1

    iput-byte v1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->ackRetryCounter:B

    const/4 v1, 0x5

    if-le v0, v1, :cond_1

    .line 1284
    invoke-direct {p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->watchDogTimeout()V

    .line 1305
    :goto_0
    return-void

    .line 1289
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->cancelAckTimerAndResetRetry(Z)V

    .line 1290
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->controller:Lcom/disney/emagine/sdk/ble/EMTController;

    new-instance v1, Lcom/disney/emagine/sdk/ble/EMTDevice$2;

    invoke-direct {v1, p0}, Lcom/disney/emagine/sdk/ble/EMTDevice$2;-><init>(Lcom/disney/emagine/sdk/ble/EMTDevice;)V

    .line 1303
    invoke-virtual {v1, p0}, Lcom/disney/emagine/sdk/ble/EMTDevice$2;->init(Lcom/disney/emagine/sdk/ble/EMTDevice;)Ljava/lang/Runnable;

    move-result-object v1

    .line 1290
    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/ble/EMTController;->postToHandler(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public cancelAckTimerAndResetRetry(Z)V
    .locals 4
    .param p1, "reset"    # Z

    .prologue
    const/4 v3, 0x0

    .line 1253
    iget-boolean v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->watchDogDebug:Z

    if-eqz v0, :cond_0

    .line 1254
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v2, "Cancel ackTimer"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1256
    :cond_0
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->ackTimer:Ljava/util/Timer;

    if-nez v0, :cond_2

    .line 1272
    :cond_1
    :goto_0
    return-void

    .line 1261
    :cond_2
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->ackTimerTask:Ljava/util/TimerTask;

    invoke-virtual {v0}, Ljava/util/TimerTask;->cancel()Z

    .line 1262
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->ackTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 1263
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->ackTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->purge()I

    .line 1265
    iput-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->ackTimer:Ljava/util/Timer;

    .line 1266
    iput-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->ackTimerTask:Ljava/util/TimerTask;

    .line 1268
    if-eqz p1, :cond_1

    .line 1270
    const/4 v0, 0x0

    iput-byte v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->ackRetryCounter:B

    goto :goto_0
.end method

.method public cancelAndInvalidate()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1092
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v2, "Timer - cancelAndInvalidate"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1094
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->cancelWatchDogTimer()V

    .line 1095
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->cancelAckTimerAndResetRetry(Z)V

    .line 1097
    monitor-enter p0

    .line 1099
    const/4 v0, 0x0

    :try_start_0
    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    .line 1100
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->incomingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    .line 1101
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->lastReadyCheck:Z

    .line 1102
    const/4 v0, 0x0

    iput v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->receiveFrameCounter:I

    .line 1103
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1105
    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->packetsToWrite:Ljava/util/ArrayList;

    monitor-enter v1

    .line 1107
    :try_start_1
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->packetsToWrite:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 1108
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1110
    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->pendingOperations:Ljava/util/ArrayList;

    monitor-enter v1

    .line 1112
    :try_start_2
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->pendingOperations:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 1113
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 1115
    iput-boolean v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->packetInFlight:Z

    .line 1116
    iput-byte v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->ackRetryCounter:B

    .line 1117
    return-void

    .line 1103
    :catchall_0
    move-exception v0

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v0

    .line 1108
    :catchall_1
    move-exception v0

    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v0

    .line 1113
    :catchall_2
    move-exception v0

    :try_start_5
    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v0
.end method

.method public cancelWatchDogTimer()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1374
    iget-boolean v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->watchDogDebug:Z

    if-eqz v0, :cond_0

    .line 1375
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v2, "Cancel watchDogTimer"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1377
    :cond_0
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->watchDogTimer:Ljava/util/Timer;

    if-nez v0, :cond_1

    .line 1388
    :goto_0
    return-void

    .line 1382
    :cond_1
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->watchDogTimerTask:Ljava/util/TimerTask;

    invoke-virtual {v0}, Ljava/util/TimerTask;->cancel()Z

    .line 1383
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->watchDogTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 1384
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->watchDogTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->purge()I

    .line 1386
    iput-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->watchDogTimerTask:Ljava/util/TimerTask;

    .line 1387
    iput-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->watchDogTimer:Ljava/util/Timer;

    goto :goto_0
.end method

.method public decryptMessage([B[BB)[B
    .locals 7
    .param p1, "data"    # [B
    .param p2, "nonce"    # [B
    .param p3, "keySlot"    # B

    .prologue
    const/4 v3, 0x0

    .line 1508
    iget-object v4, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->keyStore:Lcom/disney/emagine/sdk/keystore/EMTKeyStore;

    invoke-virtual {v4, p3}, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->keyForSlot(B)[B

    move-result-object v2

    check-cast v2, [B

    .line 1510
    .local v2, "key":[B
    iget-object v4, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mCrypto:Lcom/disney/emagine/sdk/crypto/EMTCrypto;

    .line 1521
    iget-object v4, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mCrypto:Lcom/disney/emagine/sdk/crypto/EMTCrypto;

    if-eqz v2, :cond_1

    .line 1523
    iget-object v4, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mCrypto:Lcom/disney/emagine/sdk/crypto/EMTCrypto;

    .line 1530
    array-length v4, p1

    iget-object v5, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mCrypto:Lcom/disney/emagine/sdk/crypto/EMTCrypto;

    add-int/lit8 v4, v4, 0x4

    iget-object v5, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mCrypto:Lcom/disney/emagine/sdk/crypto/EMTCrypto;

    add-int/lit8 v4, v4, 0x10

    new-array v1, v4, [B

    .line 1532
    .local v1, "in":[B
    const/4 v4, 0x0

    invoke-static {v1, v4}, Lcom/disney/emagine/sdk/EMTData;->memsetBytes([BB)[B

    .line 1533
    array-length v4, p1

    invoke-static {p1, v1, v4}, Lcom/disney/emagine/sdk/EMTData;->copyOf([B[BI)[B

    .line 1535
    iget-object v4, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mCrypto:Lcom/disney/emagine/sdk/crypto/EMTCrypto;

    array-length v4, p1

    invoke-static {v1, v4, p2, v2}, Lcom/disney/emagine/sdk/crypto/EMTCrypto;->aesCCMDecrypt([BI[B[B)[B

    move-result-object v0

    .line 1537
    .local v0, "decrypted":[B
    if-nez v0, :cond_0

    .line 1539
    iget-object v4, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v5, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v6, "******* Decrypted Data: NULL"

    invoke-virtual {v4, v5, v6}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    move-object v0, v3

    .line 1590
    .end local v0    # "decrypted":[B
    .end local v1    # "in":[B
    :goto_0
    return-object v0

    .line 1543
    .restart local v0    # "decrypted":[B
    .restart local v1    # "in":[B
    :cond_0
    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mCrypto:Lcom/disney/emagine/sdk/crypto/EMTCrypto;

    goto :goto_0

    .line 1552
    .end local v0    # "decrypted":[B
    .end local v1    # "in":[B
    :cond_1
    iget-object v4, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mCrypto:Lcom/disney/emagine/sdk/crypto/EMTCrypto;

    move-object v0, v3

    .line 1590
    goto :goto_0
.end method

.method public deviceIDFromRadioID(J)J
    .locals 7
    .param p1, "radioID"    # J

    .prologue
    .line 816
    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceIDToRadioID:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    .line 817
    .local v2, "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 819
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Long;>;"
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 821
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    .line 823
    .local v0, "deviceID":Ljava/lang/Long;
    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceIDToRadioID:Ljava/util/HashMap;

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    cmp-long v3, v4, p1

    if-nez v3, :cond_0

    .line 825
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    .line 830
    .end local v0    # "deviceID":Ljava/lang/Long;
    :goto_0
    return-wide v4

    :cond_1
    const-wide/16 v4, 0x0

    goto :goto_0
.end method

.method public generateNonceWithHeader(Lcom/disney/emagine/sdk/EMTMessageHeader;)[B
    .locals 7
    .param p1, "header"    # Lcom/disney/emagine/sdk/EMTMessageHeader;

    .prologue
    const/4 v6, 0x0

    .line 1447
    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mCrypto:Lcom/disney/emagine/sdk/crypto/EMTCrypto;

    const/16 v3, 0xd

    new-array v2, v3, [B

    .line 1452
    .local v2, "nonce":[B
    invoke-virtual {p1}, Lcom/disney/emagine/sdk/EMTMessageHeader;->senderAddress()I

    move-result v3

    int-to-short v0, v3

    .line 1454
    .local v0, "addr":S
    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mCrypto:Lcom/disney/emagine/sdk/crypto/EMTCrypto;

    .line 1459
    shr-int/lit8 v3, v0, 0x8

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    aput-byte v3, v2, v6

    .line 1460
    const/4 v3, 0x1

    shr-int/lit8 v4, v0, 0x0

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    .line 1463
    invoke-virtual {p1}, Lcom/disney/emagine/sdk/EMTMessageHeader;->targetAddress()I

    move-result v3

    int-to-short v0, v3

    .line 1465
    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mCrypto:Lcom/disney/emagine/sdk/crypto/EMTCrypto;

    .line 1470
    const/4 v3, 0x2

    shr-int/lit8 v4, v0, 0x8

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    .line 1471
    const/4 v3, 0x3

    shr-int/lit8 v4, v0, 0x0

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    .line 1474
    invoke-virtual {p1}, Lcom/disney/emagine/sdk/EMTMessageHeader;->frameCounter()I

    move-result v1

    .line 1476
    .local v1, "fc":I
    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mCrypto:Lcom/disney/emagine/sdk/crypto/EMTCrypto;

    .line 1481
    const/4 v3, 0x4

    shr-int/lit8 v4, v1, 0x18

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    .line 1482
    const/4 v3, 0x5

    shr-int/lit8 v4, v1, 0x10

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    .line 1483
    const/4 v3, 0x6

    shr-int/lit8 v4, v1, 0x8

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    .line 1484
    const/4 v3, 0x7

    shr-int/lit8 v4, v1, 0x0

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    .line 1486
    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->calculatedNonce:[B

    if-eqz v3, :cond_0

    .line 1488
    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->calculatedNonce:[B

    const/16 v4, 0x8

    iget-byte v5, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->NONCE_SIZE:B

    invoke-static {v3, v6, v2, v4, v5}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BI[BII)[B

    .line 1491
    :cond_0
    return-object v2
.end method

.method public initializeReset(J)V
    .locals 5
    .param p1, "offset"    # J

    .prologue
    .line 1941
    monitor-enter p0

    .line 1943
    :try_start_0
    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-byte v2, v1, Lcom/disney/emagine/sdk/EMTFileTransfer;->flags:B

    or-int/lit8 v2, v2, 0x8

    int-to-byte v2, v2

    iput-byte v2, v1, Lcom/disney/emagine/sdk/EMTFileTransfer;->flags:B

    .line 1945
    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-byte v1, v1, Lcom/disney/emagine/sdk/EMTFileTransfer;->flags:B

    and-int/lit8 v1, v1, 0x2

    if-lez v1, :cond_1

    .line 1947
    sget-boolean v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-object v1, v1, Lcom/disney/emagine/sdk/EMTFileTransfer;->uncompressedContents:[B

    if-nez v1, :cond_0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 1963
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 1948
    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v2, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "initializeReset; calling compressSource at offset "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "..."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1950
    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iput-wide p1, v1, Lcom/disney/emagine/sdk/EMTFileTransfer;->resetOffset:J

    .line 1951
    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    const-wide/16 v2, 0x0

    iput-wide v2, v1, Lcom/disney/emagine/sdk/EMTFileTransfer;->offset:J

    .line 1952
    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    const-wide/16 v2, 0x0

    iput-wide v2, v1, Lcom/disney/emagine/sdk/EMTFileTransfer;->previousOffset:J

    .line 1954
    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-object v1, v1, Lcom/disney/emagine/sdk/EMTFileTransfer;->uncompressedContents:[B

    long-to-int v2, p1

    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-object v3, v3, Lcom/disney/emagine/sdk/EMTFileTransfer;->uncompressedContents:[B

    array-length v3, v3

    invoke-static {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v0

    .line 1956
    .local v0, "contents":[B
    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    invoke-static {v0}, Lcom/disney/emagine/sdk/zip/EMTCompressor;->compressSource([B)[B

    move-result-object v2

    iput-object v2, v1, Lcom/disney/emagine/sdk/EMTFileTransfer;->contents:[B

    .line 1963
    .end local v0    # "contents":[B
    :goto_0
    monitor-exit p0

    .line 1964
    return-void

    .line 1960
    :cond_1
    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    const-wide/16 v2, 0x0

    iput-wide v2, v1, Lcom/disney/emagine/sdk/EMTFileTransfer;->resetOffset:J

    .line 1961
    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iput-wide p1, v1, Lcom/disney/emagine/sdk/EMTFileTransfer;->offset:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method public isReady()Z
    .locals 1

    .prologue
    .line 258
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->controller:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/ble/EMTController;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mWriteCharacteristic:Landroid/bluetooth/BluetoothGattCharacteristic;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mNotifyCharacteristic:Landroid/bluetooth/BluetoothGattCharacteristic;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->notifySubscribed()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public loopbackWithCompletion([BLcom/disney/emagine/sdk/completion/EMTLoopbackCompletion;)V
    .locals 7
    .param p1, "payload"    # [B
    .param p2, "completion"    # Lcom/disney/emagine/sdk/completion/EMTLoopbackCompletion;

    .prologue
    const/4 v5, 0x2

    .line 285
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->isReady()Z

    move-result v2

    if-nez v2, :cond_0

    .line 287
    new-instance v2, Lcom/disney/emagine/sdk/apple/NSError;

    const-string v3, "com.disney.eMagine"

    const-string v4, "Device is not connected."

    invoke-direct {v2, v3, v5, v4}, Lcom/disney/emagine/sdk/apple/NSError;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    invoke-virtual {p2, v2}, Lcom/disney/emagine/sdk/completion/EMTLoopbackCompletion;->run(Lcom/disney/emagine/sdk/apple/NSError;)V

    .line 326
    :goto_0
    return-void

    .line 292
    :cond_0
    array-length v2, p1

    const/16 v3, 0x13

    if-le v2, v3, :cond_1

    .line 294
    new-instance v2, Lcom/disney/emagine/sdk/apple/NSError;

    const-string v3, "com.disney.eMagine"

    const-string v4, "Loopback payload cannot be greater than 19 bytes."

    invoke-direct {v2, v3, v5, v4}, Lcom/disney/emagine/sdk/apple/NSError;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    invoke-virtual {p2, v2}, Lcom/disney/emagine/sdk/completion/EMTLoopbackCompletion;->run(Lcom/disney/emagine/sdk/apple/NSError;)V

    goto :goto_0

    .line 301
    :cond_1
    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->loopbackOperation:Ljava/util/HashMap;

    monitor-enter v3

    .line 303
    :try_start_0
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->loopbackOperation:Ljava/util/HashMap;

    const-string v4, "completion"

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 305
    new-instance v2, Lcom/disney/emagine/sdk/apple/NSError;

    const-string v4, "com.disney.eMagine"

    const/4 v5, 0x2

    const-string v6, "Loopback request already in progress."

    invoke-direct {v2, v4, v5, v6}, Lcom/disney/emagine/sdk/apple/NSError;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    invoke-virtual {p2, v2}, Lcom/disney/emagine/sdk/completion/EMTLoopbackCompletion;->run(Lcom/disney/emagine/sdk/apple/NSError;)V

    .line 307
    monitor-exit v3

    goto :goto_0

    .line 312
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 310
    :cond_2
    :try_start_1
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->loopbackOperation:Ljava/util/HashMap;

    const-string v4, "completion"

    invoke-virtual {v2, v4, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 311
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->loopbackOperation:Ljava/util/HashMap;

    const-string v4, "payload"

    invoke-virtual {v2, v4, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 312
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 315
    const/4 v2, 0x1

    new-array v0, v2, [B

    const/4 v2, 0x0

    const/4 v3, -0x1

    aput-byte v3, v0, v2

    .line 317
    .local v0, "data":[B
    invoke-static {v0, p1}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v0

    .line 320
    :try_start_2
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->controller:Lcom/disney/emagine/sdk/ble/EMTController;

    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mWriteCharacteristic:Landroid/bluetooth/BluetoothGattCharacteristic;

    iget v4, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->EMAGINE_WRITEMODE:I

    invoke-virtual {v2, v0, v3, v4}, Lcom/disney/emagine/sdk/ble/EMTController;->writePacket([BLandroid/bluetooth/BluetoothGattCharacteristic;I)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 321
    :catch_0
    move-exception v1

    .line 324
    .local v1, "ex":Ljava/io/IOException;
    new-instance v2, Lcom/disney/emagine/sdk/apple/NSError;

    const-string v3, "com.disney.eMagine"

    const-string v4, "Loopback request already in progress."

    invoke-direct {v2, v3, v5, v4}, Lcom/disney/emagine/sdk/apple/NSError;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    invoke-virtual {p2, v2}, Lcom/disney/emagine/sdk/completion/EMTLoopbackCompletion;->run(Lcom/disney/emagine/sdk/apple/NSError;)V

    goto :goto_0
.end method

.method public notifySubscribed()Z
    .locals 2

    .prologue
    .line 240
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mNotifyCharacteristic:Landroid/bluetooth/BluetoothGattCharacteristic;

    if-eqz v0, :cond_0

    .line 242
    new-instance v0, Lcom/disney/emagine/sdk/ble/EMTCharacteristicHelper;

    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mNotifyCharacteristic:Landroid/bluetooth/BluetoothGattCharacteristic;

    invoke-direct {v0, v1}, Lcom/disney/emagine/sdk/ble/EMTCharacteristicHelper;-><init>(Landroid/bluetooth/BluetoothGattCharacteristic;)V

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/ble/EMTCharacteristicHelper;->isNotify()Z

    move-result v0

    iput-boolean v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->notifySubscribed:Z

    .line 249
    :goto_0
    iget-boolean v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->notifySubscribed:Z

    return v0

    .line 246
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->notifySubscribed:Z

    goto :goto_0
.end method

.method public okToInitiateTransfer()Z
    .locals 1

    .prologue
    .line 200
    iget-boolean v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->transferPending:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onCharacteristicChanged(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V
    .locals 18
    .param p1, "gatt"    # Landroid/bluetooth/BluetoothGatt;
    .param p2, "characteristic"    # Landroid/bluetooth/BluetoothGattCharacteristic;

    .prologue
    .line 2653
    invoke-virtual/range {p2 .. p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getValue()[B

    move-result-object v12

    array-length v12, v12

    const/4 v13, 0x2

    if-ge v12, v13, :cond_0

    .line 2655
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v13, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v14, "Received invalid packet (length)"

    invoke-virtual {v12, v13, v14}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2875
    :goto_0
    return-void

    .line 2660
    :cond_0
    new-instance v4, Lcom/disney/emagine/sdk/EMTMessageHeader;

    invoke-virtual/range {p2 .. p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getValue()[B

    move-result-object v12

    invoke-direct {v4, v12}, Lcom/disney/emagine/sdk/EMTMessageHeader;-><init>([B)V

    .line 2662
    .local v4, "header":Lcom/disney/emagine/sdk/EMTMessageHeader;
    invoke-virtual/range {p2 .. p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getValue()[B

    move-result-object v12

    array-length v8, v12

    .line 2663
    .local v8, "payloadLength":I
    invoke-virtual {v4, v8}, Lcom/disney/emagine/sdk/EMTMessageHeader;->headerLength(I)I

    move-result v5

    .line 2665
    .local v5, "headerLength":I
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    if-nez v12, :cond_1

    invoke-virtual {v4}, Lcom/disney/emagine/sdk/EMTMessageHeader;->sequenceNumber()B

    move-result v12

    if-lez v12, :cond_1

    .line 2666
    sget-object v12, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v13, "Error: currentMessage is null when sequence number = %d"

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    invoke-virtual {v4}, Lcom/disney/emagine/sdk/EMTMessageHeader;->sequenceNumber()B

    move-result v16

    invoke-static/range {v16 .. v16}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v12, v13, v14}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 2667
    .local v6, "logStr":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v13, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    invoke-virtual {v12, v13, v6}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 2673
    .end local v6    # "logStr":Ljava/lang/String;
    :cond_1
    if-eqz v5, :cond_2

    add-int/lit8 v12, v5, 0x1

    if-ge v8, v12, :cond_3

    .line 2675
    :cond_2
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v13, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v14, "Received invalid packet (length)"

    invoke-virtual {v12, v13, v14}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 2680
    :cond_3
    invoke-virtual {v4}, Lcom/disney/emagine/sdk/EMTMessageHeader;->sequenceNumber()B

    move-result v12

    int-to-short v9, v12

    .line 2682
    .local v9, "sequence":S
    if-nez v9, :cond_4

    invoke-virtual {v4}, Lcom/disney/emagine/sdk/EMTMessageHeader;->protocolVersion()B

    move-result v12

    if-eqz v12, :cond_4

    .line 2684
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v13, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v14, "Error: protocol version is not valid."

    invoke-virtual {v12, v13, v14}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2685
    const/4 v12, 0x0

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    goto :goto_0

    .line 2690
    :cond_4
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    if-eqz v12, :cond_5

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    iget-byte v12, v12, Lcom/disney/emagine/sdk/EMTMessage;->sequence:B

    if-eq v9, v12, :cond_5

    .line 2692
    sget-object v12, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v13, "Sequence number mismatch; expected %d but got %d"

    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-byte v0, v0, Lcom/disney/emagine/sdk/EMTMessage;->sequence:B

    move/from16 v16, v0

    invoke-static/range {v16 .. v16}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v16

    aput-object v16, v14, v15

    const/4 v15, 0x1

    invoke-static {v9}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v12, v13, v14}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    .line 2693
    .local v10, "userInfo":Ljava/lang/String;
    new-instance v2, Lcom/disney/emagine/sdk/apple/NSError;

    const-string v12, "com.disney.eMagine"

    const/4 v13, 0x3

    invoke-direct {v2, v12, v13, v10}, Lcom/disney/emagine/sdk/apple/NSError;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 2694
    .local v2, "err":Lcom/disney/emagine/sdk/apple/NSError;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v13, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    invoke-virtual {v12, v13, v10}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2696
    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceDidExperienceProtocolError(Lcom/disney/emagine/sdk/apple/NSError;)V

    .line 2697
    const/4 v12, 0x0

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    goto/16 :goto_0

    .line 2703
    .end local v2    # "err":Lcom/disney/emagine/sdk/apple/NSError;
    .end local v10    # "userInfo":Ljava/lang/String;
    :cond_5
    if-nez v9, :cond_c

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    if-nez v12, :cond_c

    .line 2706
    invoke-virtual {v4}, Lcom/disney/emagine/sdk/EMTMessageHeader;->protocolVersion()B

    move-result v12

    if-eqz v12, :cond_6

    .line 2708
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v13, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v14, "Did not receive proper protocol version"

    invoke-virtual {v12, v13, v14}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2709
    const/4 v12, 0x0

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    goto/16 :goto_0

    .line 2713
    :cond_6
    new-instance v12, Lcom/disney/emagine/sdk/EMTMessage;

    invoke-direct {v12}, Lcom/disney/emagine/sdk/EMTMessage;-><init>()V

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    .line 2714
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    const/4 v13, 0x0

    new-array v13, v13, [B

    iput-object v13, v12, Lcom/disney/emagine/sdk/EMTMessage;->data:[B

    .line 2715
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    invoke-virtual {v4}, Lcom/disney/emagine/sdk/EMTMessageHeader;->messageSize()S

    move-result v13

    int-to-long v14, v13

    iput-wide v14, v12, Lcom/disney/emagine/sdk/EMTMessage;->length:J

    .line 2716
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    const/4 v13, 0x0

    iput-byte v13, v12, Lcom/disney/emagine/sdk/EMTMessage;->sequence:B

    .line 2718
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mCrypto:Lcom/disney/emagine/sdk/crypto/EMTCrypto;

    .line 2720
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mCrypto:Lcom/disney/emagine/sdk/crypto/EMTCrypto;

    .line 2725
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    invoke-virtual {v4}, Lcom/disney/emagine/sdk/EMTMessageHeader;->keySlot()B

    move-result v13

    iput-byte v13, v12, Lcom/disney/emagine/sdk/EMTMessage;->keySlot:B

    .line 2728
    invoke-virtual {v4}, Lcom/disney/emagine/sdk/EMTMessageHeader;->isForwardFlagSet()Z

    move-result v12

    if-eqz v12, :cond_9

    .line 2731
    new-instance v13, Lcom/disney/emagine/sdk/apple/NSAssert;

    invoke-virtual {v4}, Lcom/disney/emagine/sdk/EMTMessageHeader;->targetAddress()I

    move-result v12

    if-eqz v12, :cond_8

    const/4 v12, 0x1

    :goto_1
    const-string v14, "Received Target Address was not set"

    invoke-direct {v13, v12, v14}, Lcom/disney/emagine/sdk/apple/NSAssert;-><init>(ZLjava/lang/String;)V

    .line 2733
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    invoke-virtual {v4}, Lcom/disney/emagine/sdk/EMTMessageHeader;->targetAddress()I

    move-result v13

    const v14, 0xffff

    and-int/2addr v13, v14

    iput v13, v12, Lcom/disney/emagine/sdk/EMTMessage;->targetAddress:I

    .line 2734
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    invoke-virtual {v4}, Lcom/disney/emagine/sdk/EMTMessageHeader;->senderAddress()I

    move-result v13

    const v14, 0xffff

    and-int/2addr v13, v14

    iput v13, v12, Lcom/disney/emagine/sdk/EMTMessage;->senderAddress:I

    .line 2736
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    iget v12, v12, Lcom/disney/emagine/sdk/EMTMessage;->senderAddress:I

    if-nez v12, :cond_7

    .line 2738
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    const/4 v13, 0x1

    iput v13, v12, Lcom/disney/emagine/sdk/EMTMessage;->senderAddress:I

    .line 2749
    :cond_7
    :goto_2
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mCrypto:Lcom/disney/emagine/sdk/crypto/EMTCrypto;

    .line 2751
    invoke-virtual {v4}, Lcom/disney/emagine/sdk/EMTMessageHeader;->frameCounter()I

    move-result v3

    .line 2753
    .local v3, "fc":I
    move-object/from16 v0, p0

    iget v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->receiveFrameCounter:I

    if-gt v3, v12, :cond_a

    .line 2755
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v13, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v14, "Received Frame Counter is less than or equal to expected receive frame counter"

    invoke-virtual {v12, v13, v14}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2731
    .end local v3    # "fc":I
    :cond_8
    const/4 v12, 0x0

    goto :goto_1

    .line 2745
    :cond_9
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    const/4 v13, 0x1

    iput v13, v12, Lcom/disney/emagine/sdk/EMTMessage;->senderAddress:I

    .line 2746
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    const v13, 0xfffe

    iput v13, v12, Lcom/disney/emagine/sdk/EMTMessage;->targetAddress:I

    goto :goto_2

    .line 2761
    .restart local v3    # "fc":I
    :cond_a
    move-object/from16 v0, p0

    iput v3, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->receiveFrameCounter:I

    .line 2762
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/disney/emagine/sdk/ble/EMTDevice;->generateNonceWithHeader(Lcom/disney/emagine/sdk/EMTMessageHeader;)[B

    move-result-object v13

    iput-object v13, v12, Lcom/disney/emagine/sdk/EMTMessage;->nonce:[B

    .line 2764
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    iget-object v12, v12, Lcom/disney/emagine/sdk/EMTMessage;->nonce:[B

    if-nez v12, :cond_b

    .line 2766
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v13, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v14, "Error: generateNonceWithHeader returned a null"

    invoke-virtual {v12, v13, v14}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2768
    const/4 v12, 0x0

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    goto/16 :goto_0

    .line 2773
    :cond_b
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mCrypto:Lcom/disney/emagine/sdk/crypto/EMTCrypto;

    .line 2783
    .end local v3    # "fc":I
    :cond_c
    invoke-virtual/range {p2 .. p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getValue()[B

    move-result-object v11

    .line 2784
    .local v11, "value":[B
    invoke-static {v11, v5, v8}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v7

    .line 2787
    .local v7, "payload":[B
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    if-nez v12, :cond_d

    .line 2788
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v13, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v14, "Error: currentMessage is null."

    invoke-virtual {v12, v13, v14}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2791
    :cond_d
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    iget-object v12, v12, Lcom/disney/emagine/sdk/EMTMessage;->data:[B

    if-nez v12, :cond_e

    .line 2792
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v13, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v14, "Error: currentMessage.data is null"

    invoke-virtual {v12, v13, v14}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2795
    :cond_e
    array-length v12, v7

    if-gtz v12, :cond_f

    .line 2796
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v13, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v14, "Error: the palyload length is zero."

    invoke-virtual {v12, v13, v14}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2798
    :cond_f
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    iget-object v13, v13, Lcom/disney/emagine/sdk/EMTMessage;->data:[B

    invoke-static {v13, v7}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v13

    iput-object v13, v12, Lcom/disney/emagine/sdk/EMTMessage;->data:[B

    .line 2800
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    iget-object v12, v12, Lcom/disney/emagine/sdk/EMTMessage;->data:[B

    array-length v12, v12

    int-to-long v12, v12

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    iget-wide v14, v14, Lcom/disney/emagine/sdk/EMTMessage;->length:J

    cmp-long v12, v12, v14

    if-nez v12, :cond_13

    .line 2802
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mCrypto:Lcom/disney/emagine/sdk/crypto/EMTCrypto;

    .line 2804
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mCrypto:Lcom/disney/emagine/sdk/crypto/EMTCrypto;

    .line 2809
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    iget-byte v12, v12, Lcom/disney/emagine/sdk/EMTMessage;->keySlot:B

    if-eqz v12, :cond_12

    .line 2811
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    iget-object v12, v12, Lcom/disney/emagine/sdk/EMTMessage;->nonce:[B

    if-nez v12, :cond_10

    .line 2813
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v13, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v14, "Error: no nonce for message, so discarding remaining fragment."

    invoke-virtual {v12, v13, v14}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2815
    const/4 v12, 0x0

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    goto/16 :goto_0

    .line 2820
    :cond_10
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    iget-object v13, v13, Lcom/disney/emagine/sdk/EMTMessage;->data:[B

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    iget-object v14, v14, Lcom/disney/emagine/sdk/EMTMessage;->nonce:[B

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    iget-byte v15, v15, Lcom/disney/emagine/sdk/EMTMessage;->keySlot:B

    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v14, v15}, Lcom/disney/emagine/sdk/ble/EMTDevice;->decryptMessage([B[BB)[B

    move-result-object v13

    iput-object v13, v12, Lcom/disney/emagine/sdk/EMTMessage;->data:[B

    .line 2822
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    iget-object v12, v12, Lcom/disney/emagine/sdk/EMTMessage;->data:[B

    if-eqz v12, :cond_11

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    iget-object v12, v12, Lcom/disney/emagine/sdk/EMTMessage;->data:[B

    array-length v12, v12

    if-nez v12, :cond_12

    .line 2824
    :cond_11
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v13, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v14, "Error: unable to decrypt message"

    invoke-virtual {v12, v13, v14}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2826
    const/4 v12, 0x0

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    goto/16 :goto_0

    .line 2840
    :cond_12
    invoke-static {}, Lcom/disney/emagine/app/EmagineApplication;->app()Lcom/disney/emagine/app/EmagineApplication;

    move-result-object v12

    invoke-virtual {v12}, Lcom/disney/emagine/app/EmagineApplication;->backgroundHandler()Landroid/os/Handler;

    move-result-object v12

    new-instance v13, Lcom/disney/emagine/sdk/ble/EMTDevice$7;

    move-object/from16 v0, p0

    invoke-direct {v13, v0}, Lcom/disney/emagine/sdk/ble/EMTDevice$7;-><init>(Lcom/disney/emagine/sdk/ble/EMTDevice;)V

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    .line 2852
    invoke-virtual {v13, v14}, Lcom/disney/emagine/sdk/ble/EMTDevice$7;->init(Lcom/disney/emagine/sdk/EMTMessage;)Ljava/lang/Runnable;

    move-result-object v13

    .line 2840
    invoke-virtual {v12, v13}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 2854
    const/4 v12, 0x0

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    goto/16 :goto_0

    .line 2858
    :cond_13
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    iget-object v12, v12, Lcom/disney/emagine/sdk/EMTMessage;->data:[B

    array-length v12, v12

    int-to-long v12, v12

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    iget-wide v14, v14, Lcom/disney/emagine/sdk/EMTMessage;->length:J

    cmp-long v12, v12, v14

    if-lez v12, :cond_14

    .line 2861
    sget-object v12, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v13, "Received more data than expected; expected %d but got %d"

    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-wide v0, v0, Lcom/disney/emagine/sdk/EMTMessage;->length:J

    move-wide/from16 v16, v0

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v16

    aput-object v16, v14, v15

    const/4 v15, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/disney/emagine/sdk/EMTMessage;->data:[B

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v16, v0

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v12, v13, v14}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    .line 2862
    .restart local v10    # "userInfo":Ljava/lang/String;
    new-instance v2, Lcom/disney/emagine/sdk/apple/NSError;

    const-string v12, "com.disney.eMagine"

    const/4 v13, 0x3

    invoke-direct {v2, v12, v13, v10}, Lcom/disney/emagine/sdk/apple/NSError;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 2864
    .restart local v2    # "err":Lcom/disney/emagine/sdk/apple/NSError;
    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceDidExperienceProtocolError(Lcom/disney/emagine/sdk/apple/NSError;)V

    .line 2865
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v13, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v14, "Error: currentMessage.data.length > currentMessage.length.  Setting CurrentMessage to null"

    invoke-virtual {v12, v13, v14}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 2867
    const/4 v12, 0x0

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    goto/16 :goto_0

    .line 2873
    .end local v2    # "err":Lcom/disney/emagine/sdk/apple/NSError;
    .end local v10    # "userInfo":Ljava/lang/String;
    :cond_14
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    iget-byte v13, v12, Lcom/disney/emagine/sdk/EMTMessage;->sequence:B

    add-int/lit8 v13, v13, 0x1

    int-to-byte v13, v13

    iput-byte v13, v12, Lcom/disney/emagine/sdk/EMTMessage;->sequence:B

    .line 2874
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    iget-byte v13, v12, Lcom/disney/emagine/sdk/EMTMessage;->sequence:B

    and-int/lit8 v13, v13, 0x3f

    int-to-byte v13, v13

    iput-byte v13, v12, Lcom/disney/emagine/sdk/EMTMessage;->sequence:B

    goto/16 :goto_0
.end method

.method public onCharacteristicWrite(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;I)V
    .locals 3
    .param p1, "gatt"    # Landroid/bluetooth/BluetoothGatt;
    .param p2, "characteristic"    # Landroid/bluetooth/BluetoothGattCharacteristic;
    .param p3, "status"    # I

    .prologue
    .line 2629
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->packetInFlight:Z

    .line 2631
    if-eqz p3, :cond_0

    .line 2633
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v2, "onCharacteristicWrite failed."

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    .line 2634
    invoke-static {}, Ljava/lang/Thread;->dumpStack()V

    .line 2635
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->packetsToWrite:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2644
    :goto_0
    return-void

    .line 2639
    :cond_0
    invoke-static {}, Lcom/disney/emagine/app/EmagineApplication;->app()Lcom/disney/emagine/app/EmagineApplication;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/emagine/app/EmagineApplication;->backgroundHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/disney/emagine/sdk/ble/EMTDevice$6;

    invoke-direct {v1, p0}, Lcom/disney/emagine/sdk/ble/EMTDevice$6;-><init>(Lcom/disney/emagine/sdk/ble/EMTDevice;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method protected onConnectionStateChange(II)V
    .locals 0
    .param p1, "status"    # I
    .param p2, "newState"    # I

    .prologue
    .line 2897
    return-void
.end method

.method onDeviceRssi(I)V
    .locals 0
    .param p1, "rssi"    # I

    .prologue
    .line 2905
    return-void
.end method

.method public onReadRemoteRssi(Z)V
    .locals 0
    .param p1, "success"    # Z

    .prologue
    .line 2887
    return-void
.end method

.method public performWhenReady(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "completion"    # Ljava/lang/Runnable;

    .prologue
    .line 268
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->isReady()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 270
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->controller:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/ble/EMTController;->postToHandler(Ljava/lang/Runnable;)V

    .line 276
    :goto_0
    return-void

    .line 275
    :cond_0
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->readyCompletions:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public peripheral()Landroid/bluetooth/BluetoothDevice;
    .locals 1

    .prologue
    .line 231
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mDevice:Landroid/bluetooth/BluetoothDevice;

    return-object v0
.end method

.method public pingWithCompletion(BLcom/disney/emagine/sdk/completion/EMTPingCompletion;)V
    .locals 9
    .param p1, "length"    # B
    .param p2, "completion"    # Lcom/disney/emagine/sdk/completion/EMTPingCompletion;

    .prologue
    const/16 v5, 0x4005

    const/4 v8, 0x2

    .line 335
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->isReady()Z

    move-result v4

    if-nez v4, :cond_0

    .line 337
    new-instance v4, Lcom/disney/emagine/sdk/apple/NSError;

    const-string v5, "com.disney.eMagine"

    const-string v6, "Device is not connected."

    invoke-direct {v4, v5, v8, v6}, Lcom/disney/emagine/sdk/apple/NSError;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    invoke-virtual {p2, v4}, Lcom/disney/emagine/sdk/completion/EMTPingCompletion;->run(Lcom/disney/emagine/sdk/apple/NSError;)V

    .line 373
    :goto_0
    return-void

    .line 342
    :cond_0
    new-array v3, p1, [B

    .line 344
    .local v3, "payload":[B
    const/4 v0, 0x0

    .local v0, "loop":B
    :goto_1
    if-ge v0, p1, :cond_1

    .line 346
    const/4 v4, 0x0

    aput-byte v4, v3, v0

    .line 344
    add-int/lit8 v4, v0, 0x1

    int-to-byte v0, v4

    goto :goto_1

    .line 349
    :cond_1
    iget-object v4, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    if-nez v4, :cond_2

    .line 351
    monitor-enter p0

    .line 353
    :try_start_0
    new-instance v4, Lcom/disney/emagine/sdk/EMTFileTransfer;

    invoke-direct {v4}, Lcom/disney/emagine/sdk/EMTFileTransfer;-><init>()V

    iput-object v4, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    .line 354
    iget-object v4, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-wide v6, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    iput-wide v6, v4, Lcom/disney/emagine/sdk/EMTFileTransfer;->deviceId:J

    .line 355
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 358
    :cond_2
    const/4 v4, 0x1

    invoke-direct {p0, v4, v5}, Lcom/disney/emagine/sdk/ble/EMTDevice;->createMessageForOutgoing(ZI)Lcom/disney/emagine/sdk/EMTMessage;

    move-result-object v1

    .line 360
    .local v1, "message":Lcom/disney/emagine/sdk/EMTMessage;
    if-nez v1, :cond_3

    .line 362
    new-instance v4, Lcom/disney/emagine/sdk/apple/NSError;

    const-string v5, "com.disney.eMagine"

    const-string v6, "Outgoing redio id not found."

    invoke-direct {v4, v5, v8, v6}, Lcom/disney/emagine/sdk/apple/NSError;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    invoke-virtual {p2, v4}, Lcom/disney/emagine/sdk/completion/EMTPingCompletion;->run(Lcom/disney/emagine/sdk/apple/NSError;)V

    goto :goto_0

    .line 355
    .end local v1    # "message":Lcom/disney/emagine/sdk/EMTMessage;
    :catchall_0
    move-exception v4

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v4

    .line 367
    .restart local v1    # "message":Lcom/disney/emagine/sdk/EMTMessage;
    :cond_3
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 369
    .local v2, "parameters":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v4, "payload"

    invoke-virtual {v2, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 370
    const-string v4, "completion"

    invoke-virtual {v2, v4, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 372
    invoke-direct {p0, v5, v1, v2}, Lcom/disney/emagine/sdk/ble/EMTDevice;->encodeAndSendOperation(SLcom/disney/emagine/sdk/EMTMessage;Ljava/util/HashMap;)Z

    goto :goto_0
.end method

.method readyCheck()V
    .locals 6

    .prologue
    .line 840
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->isReady()Z

    move-result v2

    if-nez v2, :cond_1

    .line 887
    :cond_0
    :goto_0
    return-void

    .line 845
    :cond_1
    iget-boolean v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->lastReadyCheck:Z

    if-nez v2, :cond_0

    .line 850
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->isReady()Z

    move-result v2

    iput-boolean v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->lastReadyCheck:Z

    .line 853
    iget-byte v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->NONCE_SIZE:B

    new-array v1, v2, [B

    .line 855
    .local v1, "raw_nonce":[B
    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/disney/emagine/sdk/EMTData;->memsetBytes([BB)[B

    .line 857
    invoke-virtual {v1}, [B->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    iput-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->calculatedNonce:[B

    .line 858
    invoke-virtual {v1}, [B->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    iput-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->toySessionNonce:[B

    .line 860
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mCrypto:Lcom/disney/emagine/sdk/crypto/EMTCrypto;

    iget-byte v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->NONCE_SIZE:B

    invoke-static {v2}, Lcom/disney/emagine/sdk/crypto/EMTCrypto;->generateSeedBytes(I)[B

    move-result-object v1

    .line 862
    array-length v2, v1

    if-nez v2, :cond_2

    .line 867
    :cond_2
    invoke-virtual {v1}, [B->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    iput-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->appSessionNonce:[B

    .line 869
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Setting Session Nonce to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->appSessionNonce:[B

    invoke-static {v5}, Lcom/disney/emagine/sdk/EMTData;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 871
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->controller:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-virtual {v2}, Lcom/disney/emagine/sdk/ble/EMTController;->deviceDidBecomeReady()V

    .line 873
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->readyCompletions:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 880
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->readyCompletions:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    .line 882
    .local v0, "completion":Ljava/lang/Runnable;
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    goto :goto_1

    .line 886
    .end local v0    # "completion":Ljava/lang/Runnable;
    :cond_3
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->readyCompletions:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    goto :goto_0
.end method

.method public requestAnalyticsUpload()V
    .locals 3

    .prologue
    const/16 v2, 0x4008

    .line 382
    const/4 v1, 0x1

    invoke-direct {p0, v1, v2}, Lcom/disney/emagine/sdk/ble/EMTDevice;->createMessageForOutgoing(ZI)Lcom/disney/emagine/sdk/EMTMessage;

    move-result-object v0

    .line 384
    .local v0, "message":Lcom/disney/emagine/sdk/EMTMessage;
    const/4 v1, 0x0

    invoke-direct {p0, v2, v0, v1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->encodeAndSendOperation(SLcom/disney/emagine/sdk/EMTMessage;Ljava/util/HashMap;)Z

    .line 385
    return-void
.end method

.method public resendFileTransferStart()V
    .locals 7

    .prologue
    const/16 v6, 0x3fff

    .line 1121
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    if-nez v2, :cond_0

    .line 1137
    :goto_0
    return-void

    .line 1124
    :cond_0
    iget v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->frameCounter:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->frameCounter:I

    .line 1125
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    const/4 v3, 0x0

    iput-boolean v3, v2, Lcom/disney/emagine/sdk/EMTFileTransfer;->transferAccepted:Z

    .line 1126
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 1128
    .local v1, "parameters":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "filename"

    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-object v3, v3, Lcom/disney/emagine/sdk/EMTFileTransfer;->filename:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1129
    const-string v2, "crc32"

    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-wide v4, v3, Lcom/disney/emagine/sdk/EMTFileTransfer;->crc32:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1130
    const-string v2, "version"

    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget v3, v3, Lcom/disney/emagine/sdk/EMTFileTransfer;->fileVersion:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1131
    const-string v2, "length"

    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-wide v4, v3, Lcom/disney/emagine/sdk/EMTFileTransfer;->expectedLength:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1132
    const-string v2, "contents"

    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-object v3, v3, Lcom/disney/emagine/sdk/EMTFileTransfer;->contents:[B

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1134
    const/4 v2, 0x1

    invoke-direct {p0, v2, v6}, Lcom/disney/emagine/sdk/ble/EMTDevice;->createMessageForOutgoing(ZI)Lcom/disney/emagine/sdk/EMTMessage;

    move-result-object v0

    .line 1136
    .local v0, "outgoingMessage":Lcom/disney/emagine/sdk/EMTMessage;
    invoke-direct {p0, v6, v0, v1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->encodeAndSendOperation(SLcom/disney/emagine/sdk/EMTMessage;Ljava/util/HashMap;)Z

    goto :goto_0
.end method

.method public resetWatchDogTimer()V
    .locals 3

    .prologue
    .line 1395
    iget-boolean v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->watchDogDebug:Z

    if-eqz v0, :cond_0

    .line 1396
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v2, "Resetting watchDogTimer"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1398
    :cond_0
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->cancelWatchDogTimer()V

    .line 1399
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->setWatchDogTimer()V

    .line 1400
    return-void
.end method

.method public respondWithNonce()V
    .locals 9

    .prologue
    const/16 v8, 0x400d

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 394
    invoke-direct {p0, v4, v8}, Lcom/disney/emagine/sdk/ble/EMTDevice;->createMessageForOutgoing(ZI)Lcom/disney/emagine/sdk/EMTMessage;

    move-result-object v0

    .line 396
    .local v0, "message":Lcom/disney/emagine/sdk/EMTMessage;
    new-instance v6, Lcom/disney/emagine/sdk/apple/NSAssert;

    if-eqz v0, :cond_0

    move v3, v4

    :goto_0
    const-string v7, "Error, the message to response with a Nonce is null"

    invoke-direct {v6, v3, v7}, Lcom/disney/emagine/sdk/apple/NSAssert;-><init>(ZLjava/lang/String;)V

    .line 398
    new-instance v3, Lcom/disney/emagine/sdk/apple/NSAssert;

    iget-object v6, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->appSessionNonce:[B

    if-eqz v6, :cond_1

    :goto_1
    const-string v5, "Error, the App Session Nonce was never initialized"

    invoke-direct {v3, v4, v5}, Lcom/disney/emagine/sdk/apple/NSAssert;-><init>(ZLjava/lang/String;)V

    .line 401
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 403
    .local v2, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "nonce"

    iget-object v4, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->appSessionNonce:[B

    invoke-virtual {v4}, [B->clone()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 405
    invoke-direct {p0, v8, v0, v2}, Lcom/disney/emagine/sdk/ble/EMTDevice;->encodeAndSendOperation(SLcom/disney/emagine/sdk/EMTMessage;Ljava/util/HashMap;)Z

    .line 407
    new-instance v1, Ljava/util/Timer;

    invoke-direct {v1}, Ljava/util/Timer;-><init>()V

    .line 409
    .local v1, "myTimer":Ljava/util/Timer;
    new-instance v3, Lcom/disney/emagine/sdk/ble/EMTDevice$1;

    invoke-direct {v3, p0}, Lcom/disney/emagine/sdk/ble/EMTDevice$1;-><init>(Lcom/disney/emagine/sdk/ble/EMTDevice;)V

    const-wide/16 v4, 0x1f4

    invoke-virtual {v1, v3, v4, v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 441
    return-void

    .end local v1    # "myTimer":Ljava/util/Timer;
    .end local v2    # "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    move v3, v5

    .line 396
    goto :goto_0

    :cond_1
    move v4, v5

    .line 398
    goto :goto_1
.end method

.method public sendCloseBLEConnection()V
    .locals 6

    .prologue
    const/16 v5, 0x400e

    .line 780
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v4, "SEND TO MOLA ------> CLOSE_BLE_CONNECTION"

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 782
    const/4 v2, 0x1

    invoke-direct {p0, v2, v5}, Lcom/disney/emagine/sdk/ble/EMTDevice;->createMessageForOutgoing(ZI)Lcom/disney/emagine/sdk/EMTMessage;

    move-result-object v0

    .line 784
    .local v0, "message":Lcom/disney/emagine/sdk/EMTMessage;
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 786
    .local v1, "parameters":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "disconnect"

    const-string v3, "YES"

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 788
    invoke-direct {p0, v5, v0, v1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->encodeAndSendOperation(SLcom/disney/emagine/sdk/EMTMessage;Ljava/util/HashMap;)Z

    .line 790
    return-void
.end method

.method public sendDataEvent(SILcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;)V
    .locals 2
    .param p1, "event"    # S
    .param p2, "deviceId"    # I
    .param p3, "pmp"    # Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;

    .prologue
    .line 480
    invoke-static {}, Lcom/disney/emagine/sdk/keystore/EMTKeyStrategy;->sharedInstance()Lcom/disney/emagine/sdk/keystore/EMTKeyStrategy;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/disney/emagine/sdk/keystore/EMTKeyStrategy;->requiredKey(I)B

    move-result v0

    .line 482
    .local v0, "defaultKeySlot":B
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendDataEvent(SILcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;B)V

    .line 483
    return-void
.end method

.method public sendDataEvent(SILcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;B)V
    .locals 6
    .param p1, "event"    # S
    .param p2, "deviceId"    # I
    .param p3, "pmp"    # Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;
    .param p4, "keySlot"    # B

    .prologue
    .line 494
    const/4 v3, 0x0

    new-array v1, v3, [B

    .line 497
    .local v1, "data":[B
    invoke-static {p2}, Lcom/disney/emagine/sdk/EMTData;->intToBytes(I)[B

    move-result-object v3

    invoke-static {v3}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v3

    invoke-static {v1, v3}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v1

    .line 501
    const/4 v0, -0x3

    .line 503
    .local v0, "bleAddress":I
    invoke-static {v0}, Lcom/disney/emagine/sdk/EMTData;->intToBytes(I)[B

    move-result-object v3

    invoke-static {v3}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v3

    invoke-static {v1, v3}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v1

    .line 506
    invoke-static {p1}, Lcom/disney/emagine/sdk/EMTData;->shortToBytes(S)[B

    move-result-object v3

    invoke-static {v3}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v3

    invoke-static {v1, v3}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v1

    .line 509
    const/16 v3, 0x11

    invoke-static {v3}, Lcom/disney/emagine/sdk/EMTData;->shortToBytes(S)[B

    move-result-object v3

    invoke-static {v3}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v3

    invoke-static {v1, v3}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v1

    .line 512
    iget-object v3, p3, Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;->data:[B

    if-eqz v3, :cond_0

    .line 514
    iget-object v3, p3, Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;->data:[B

    invoke-static {v1, v3}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v1

    .line 517
    :cond_0
    int-to-long v4, p2

    invoke-direct {p0, v4, v5, p1, p4}, Lcom/disney/emagine/sdk/ble/EMTDevice;->createMessageForDevice(JIB)Lcom/disney/emagine/sdk/EMTMessage;

    move-result-object v2

    .line 519
    .local v2, "msg":Lcom/disney/emagine/sdk/EMTMessage;
    if-eqz v2, :cond_1

    .line 521
    iput-object v1, v2, Lcom/disney/emagine/sdk/EMTMessage;->data:[B

    .line 523
    invoke-direct {p0, v2}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendCustomLuaEvent(Lcom/disney/emagine/sdk/EMTMessage;)V

    .line 525
    :cond_1
    return-void
.end method

.method public sendDataEvent(SILjava/lang/String;)V
    .locals 2
    .param p1, "event"    # S
    .param p2, "deviceId"    # I
    .param p3, "jsonString"    # Ljava/lang/String;

    .prologue
    .line 451
    invoke-static {}, Lcom/disney/emagine/sdk/keystore/EMTKeyStrategy;->sharedInstance()Lcom/disney/emagine/sdk/keystore/EMTKeyStrategy;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/disney/emagine/sdk/keystore/EMTKeyStrategy;->requiredKey(I)B

    move-result v0

    .line 453
    .local v0, "defaultKeySlot":B
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendDataEvent(SILjava/lang/String;B)V

    .line 454
    return-void
.end method

.method public sendDataEvent(SILjava/lang/String;B)V
    .locals 2
    .param p1, "event"    # S
    .param p2, "deviceId"    # I
    .param p3, "jsonString"    # Ljava/lang/String;
    .param p4, "keySlot"    # B

    .prologue
    .line 465
    new-instance v1, Lcom/disney/emagine/sdk/marshal/EMTSerializer;

    invoke-direct {v1}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;-><init>()V

    .line 467
    .local v1, "serializer":Lcom/disney/emagine/sdk/marshal/EMTSerializer;
    invoke-virtual {v1, p3}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->PMPFromJson(Ljava/lang/String;)Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;

    move-result-object v0

    .line 469
    .local v0, "pmpData":Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;
    invoke-virtual {p0, p1, p2, v0, p4}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendDataEvent(SILcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;B)V

    .line 470
    return-void
.end method

.method public sendSimpleEvent(SI[B)V
    .locals 4
    .param p1, "event"    # S
    .param p2, "deviceId"    # I
    .param p3, "payload"    # [B

    .prologue
    .line 529
    const/4 v3, 0x0

    new-array v0, v3, [B

    .line 531
    .local v0, "data":[B
    invoke-static {p2}, Lcom/disney/emagine/sdk/EMTData;->intToBytes(I)[B

    move-result-object v3

    invoke-static {v3}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v3

    invoke-static {v0, v3}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v0

    .line 533
    const/4 v2, -0x3

    .line 535
    .local v2, "src_device_id":I
    invoke-static {v2}, Lcom/disney/emagine/sdk/EMTData;->intToBytes(I)[B

    move-result-object v3

    invoke-static {v3}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v3

    invoke-static {v0, v3}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v0

    .line 536
    invoke-static {p1}, Lcom/disney/emagine/sdk/EMTData;->shortToBytes(S)[B

    move-result-object v3

    invoke-static {v3}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v3

    invoke-static {v0, v3}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v0

    .line 537
    invoke-static {v0, p3}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v0

    .line 539
    const/4 v3, 0x1

    invoke-direct {p0, v3, p1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->createMessageForOutgoing(ZI)Lcom/disney/emagine/sdk/EMTMessage;

    move-result-object v1

    .line 541
    .local v1, "message":Lcom/disney/emagine/sdk/EMTMessage;
    if-nez v1, :cond_0

    .line 549
    :goto_0
    return-void

    .line 546
    :cond_0
    iput-object v0, v1, Lcom/disney/emagine/sdk/EMTMessage;->data:[B

    .line 548
    const/4 v3, 0x0

    invoke-direct {p0, p1, v1, v3}, Lcom/disney/emagine/sdk/ble/EMTDevice;->encodeAndSendOperation(SLcom/disney/emagine/sdk/EMTMessage;Ljava/util/HashMap;)Z

    goto :goto_0
.end method

.method public sendUpdateFirmware()V
    .locals 5

    .prologue
    const/16 v4, 0x400a

    .line 769
    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v2, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v3, "SEND TO MOLA ------> UPDATE_FIRMWARE"

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 770
    const/4 v1, 0x1

    invoke-direct {p0, v1, v4}, Lcom/disney/emagine/sdk/ble/EMTDevice;->createMessageForOutgoing(ZI)Lcom/disney/emagine/sdk/EMTMessage;

    move-result-object v0

    .line 772
    .local v0, "message":Lcom/disney/emagine/sdk/EMTMessage;
    const/4 v1, 0x0

    invoke-direct {p0, v4, v0, v1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->encodeAndSendOperation(SLcom/disney/emagine/sdk/EMTMessage;Ljava/util/HashMap;)Z

    .line 773
    return-void
.end method

.method public setAckTimer()V
    .locals 4

    .prologue
    .line 1312
    iget-boolean v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->watchDogDebug:Z

    if-eqz v0, :cond_0

    .line 1313
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v2, "Set new ackTimer"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1315
    :cond_0
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->ackTimer:Ljava/util/Timer;

    .line 1316
    new-instance v0, Lcom/disney/emagine/sdk/ble/EMTDevice$3;

    invoke-direct {v0, p0}, Lcom/disney/emagine/sdk/ble/EMTDevice$3;-><init>(Lcom/disney/emagine/sdk/ble/EMTDevice;)V

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->ackTimerTask:Ljava/util/TimerTask;

    .line 1325
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->ackTimer:Ljava/util/Timer;

    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->ackTimerTask:Ljava/util/TimerTask;

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 1326
    return-void
.end method

.method public setWatchDogTimer()V
    .locals 4

    .prologue
    .line 1407
    iget-boolean v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->watchDogDebug:Z

    if-eqz v0, :cond_0

    .line 1408
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v2, "Set new watchDogTimer"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1410
    :cond_0
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->watchDogTimer:Ljava/util/Timer;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->watchDogTimerTask:Ljava/util/TimerTask;

    if-eqz v0, :cond_2

    .line 1412
    :cond_1
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v2, "setWatchDogTimer called when if is already running."

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1427
    :goto_0
    return-void

    .line 1416
    :cond_2
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->watchDogTimer:Ljava/util/Timer;

    .line 1417
    new-instance v0, Lcom/disney/emagine/sdk/ble/EMTDevice$4;

    invoke-direct {v0, p0}, Lcom/disney/emagine/sdk/ble/EMTDevice$4;-><init>(Lcom/disney/emagine/sdk/ble/EMTDevice;)V

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->watchDogTimerTask:Ljava/util/TimerTask;

    .line 1426
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->watchDogTimer:Ljava/util/Timer;

    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->watchDogTimerTask:Ljava/util/TimerTask;

    const-wide/16 v2, 0x1388

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    goto :goto_0
.end method

.method public transferFile(Ljava/lang/String;[BIJZLcom/disney/emagine/sdk/delegate/EMTTransferDelegate;)V
    .locals 14
    .param p1, "filename"    # Ljava/lang/String;
    .param p2, "payload"    # [B
    .param p3, "version"    # I
    .param p4, "deviceId"    # J
    .param p6, "compressionOn"    # Z
    .param p7, "completion"    # Lcom/disney/emagine/sdk/delegate/EMTTransferDelegate;

    .prologue
    .line 626
    sget-boolean v8, Lcom/disney/emagine/sdk/ble/EMTDevice;->$assertionsDisabled:Z

    if-nez v8, :cond_0

    if-nez p1, :cond_0

    new-instance v8, Ljava/lang/AssertionError;

    invoke-direct {v8}, Ljava/lang/AssertionError;-><init>()V

    throw v8

    .line 627
    :cond_0
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->isReady()Z

    move-result v8

    if-nez v8, :cond_2

    .line 629
    new-instance v8, Lcom/disney/emagine/sdk/apple/NSError;

    const-string v9, "com.disney.eMagine"

    const/4 v10, 0x2

    const-string v11, "Device is not connected."

    invoke-direct {v8, v9, v10, v11}, Lcom/disney/emagine/sdk/apple/NSError;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    const/4 v9, 0x1

    const/4 v10, 0x0

    move-object/from16 v0, p7

    invoke-interface {v0, v8, v9, v10}, Lcom/disney/emagine/sdk/delegate/EMTTransferDelegate;->run(Lcom/disney/emagine/sdk/apple/NSError;ZI)V

    .line 701
    :cond_1
    :goto_0
    return-void

    .line 634
    :cond_2
    const/4 v4, 0x0

    .line 635
    .local v4, "message":Lcom/disney/emagine/sdk/EMTMessage;
    const/4 v5, 0x0

    .line 637
    .local v5, "parameters":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    monitor-enter p0

    .line 639
    :try_start_0
    iget-object v8, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    if-eqz v8, :cond_3

    .line 641
    new-instance v8, Lcom/disney/emagine/sdk/apple/NSError;

    const-string v9, "com.disney.eMagine"

    const/4 v10, 0x5

    const-string v11, "File transfer already in progress."

    invoke-direct {v8, v9, v10, v11}, Lcom/disney/emagine/sdk/apple/NSError;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    const/4 v9, 0x1

    const/4 v10, 0x0

    move-object/from16 v0, p7

    invoke-interface {v0, v8, v9, v10}, Lcom/disney/emagine/sdk/delegate/EMTTransferDelegate;->run(Lcom/disney/emagine/sdk/apple/NSError;ZI)V

    .line 643
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->cancelAndInvalidate()V

    .line 645
    monitor-exit p0

    goto :goto_0

    .line 694
    :catchall_0
    move-exception v8

    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v8

    .line 649
    :cond_3
    :try_start_1
    new-instance v8, Lcom/disney/emagine/sdk/EMTFileTransfer;

    invoke-direct {v8}, Lcom/disney/emagine/sdk/EMTFileTransfer;-><init>()V

    iput-object v8, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    .line 650
    iget-object v8, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-wide/from16 v0, p4

    iput-wide v0, v8, Lcom/disney/emagine/sdk/EMTFileTransfer;->deviceId:J

    .line 651
    iget-object v8, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iput-object p1, v8, Lcom/disney/emagine/sdk/EMTFileTransfer;->filename:Ljava/lang/String;

    .line 652
    iget-object v8, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move/from16 v0, p3

    iput v0, v8, Lcom/disney/emagine/sdk/EMTFileTransfer;->fileVersion:I

    .line 653
    iget-object v9, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    invoke-virtual/range {p2 .. p2}, [B->clone()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [B

    iput-object v8, v9, Lcom/disney/emagine/sdk/EMTFileTransfer;->uncompressedContents:[B

    .line 654
    iget-object v8, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    move-object/from16 v0, p2

    array-length v9, v0

    int-to-long v10, v9

    iput-wide v10, v8, Lcom/disney/emagine/sdk/EMTFileTransfer;->expectedLength:J

    .line 656
    new-instance v2, Ljava/util/zip/CRC32;

    invoke-direct {v2}, Ljava/util/zip/CRC32;-><init>()V

    .line 658
    .local v2, "crc32":Ljava/util/zip/CRC32;
    invoke-virtual {v2}, Ljava/util/zip/CRC32;->reset()V

    .line 659
    const/4 v8, 0x0

    move-object/from16 v0, p2

    array-length v9, v0

    move-object/from16 v0, p2

    invoke-virtual {v2, v0, v8, v9}, Ljava/util/zip/CRC32;->update([BII)V

    .line 661
    iget-object v8, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    invoke-virtual {v2}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v10

    iput-wide v10, v8, Lcom/disney/emagine/sdk/EMTFileTransfer;->crc32:J

    .line 662
    iget-object v8, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    const-wide/16 v10, 0x0

    iput-wide v10, v8, Lcom/disney/emagine/sdk/EMTFileTransfer;->offset:J

    .line 663
    iget-object v8, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    const-wide/16 v10, 0x0

    iput-wide v10, v8, Lcom/disney/emagine/sdk/EMTFileTransfer;->previousOffset:J

    .line 664
    iget-object v8, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    const-wide/16 v10, 0x0

    iput-wide v10, v8, Lcom/disney/emagine/sdk/EMTFileTransfer;->headerLength:J

    .line 665
    iget-object v8, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    const/4 v9, 0x0

    iput v9, v8, Lcom/disney/emagine/sdk/EMTFileTransfer;->packetSize:I

    .line 666
    iget-object v8, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    const/4 v9, 0x0

    iput-boolean v9, v8, Lcom/disney/emagine/sdk/EMTFileTransfer;->transferAccepted:Z

    .line 667
    iget-object v8, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget v9, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->frameCounter:I

    int-to-long v10, v9

    iput-wide v10, v8, Lcom/disney/emagine/sdk/EMTFileTransfer;->lastAckedFrameCounter:J

    .line 669
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 671
    .local v3, "extras":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v8, "completion"

    move-object/from16 v0, p7

    invoke-virtual {v3, v8, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 673
    iget-object v8, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iput-object v3, v8, Lcom/disney/emagine/sdk/EMTFileTransfer;->extras:Ljava/util/HashMap;

    .line 674
    iget-object v8, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    const/4 v9, 0x1

    iput-byte v9, v8, Lcom/disney/emagine/sdk/EMTFileTransfer;->flags:B

    .line 676
    if-eqz p6, :cond_4

    .line 679
    iget-object v8, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-byte v9, v8, Lcom/disney/emagine/sdk/EMTFileTransfer;->flags:B

    or-int/lit8 v9, v9, 0x2

    int-to-byte v9, v9

    iput-byte v9, v8, Lcom/disney/emagine/sdk/EMTFileTransfer;->flags:B

    .line 680
    iget-object v8, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    invoke-static/range {p2 .. p2}, Lcom/disney/emagine/sdk/zip/EMTCompressor;->compressSource([B)[B

    move-result-object v9

    iput-object v9, v8, Lcom/disney/emagine/sdk/EMTFileTransfer;->contents:[B

    .line 687
    :goto_2
    const/4 v8, 0x1

    const/16 v9, 0x3fff

    invoke-direct {p0, v8, v9}, Lcom/disney/emagine/sdk/ble/EMTDevice;->createMessageForOutgoing(ZI)Lcom/disney/emagine/sdk/EMTMessage;

    move-result-object v4

    .line 688
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 690
    .end local v5    # "parameters":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local v6, "parameters":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :try_start_2
    const-string v8, "filename"

    iget-object v9, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-object v9, v9, Lcom/disney/emagine/sdk/EMTFileTransfer;->filename:Ljava/lang/String;

    invoke-virtual {v6, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 691
    const-string v8, "crc32"

    iget-object v9, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-wide v10, v9, Lcom/disney/emagine/sdk/EMTFileTransfer;->crc32:J

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {v6, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 692
    const-string v8, "version"

    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v6, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 693
    const-string v8, "length"

    iget-object v9, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-wide v10, v9, Lcom/disney/emagine/sdk/EMTFileTransfer;->expectedLength:J

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {v6, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 694
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 695
    const/16 v8, 0x3fff

    invoke-direct {p0, v8, v4, v6}, Lcom/disney/emagine/sdk/ble/EMTDevice;->encodeAndSendOperation(SLcom/disney/emagine/sdk/EMTMessage;Ljava/util/HashMap;)Z

    move-result v7

    .line 696
    .local v7, "success":Z
    if-nez v7, :cond_1

    .line 698
    iget-object v8, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v9, Lcom/disney/emagine/sdk/ble/EMTDevice;->TAG:Ljava/lang/String;

    const-string v10, "ERROR: TransferFile(%s) failed."

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object p1, v11, v12

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    .line 699
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v8

    move-wide/from16 v0, p4

    long-to-int v9, v0

    invoke-virtual {v8, v9}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->disconnect(I)V

    goto/16 :goto_0

    .line 684
    .end local v6    # "parameters":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v7    # "success":Z
    .restart local v5    # "parameters":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_4
    :try_start_3
    iget-object v9, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-object v8, p0, Lcom/disney/emagine/sdk/ble/EMTDevice;->outgoingTransfer:Lcom/disney/emagine/sdk/EMTFileTransfer;

    iget-object v8, v8, Lcom/disney/emagine/sdk/EMTFileTransfer;->uncompressedContents:[B

    invoke-virtual {v8}, [B->clone()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [B

    iput-object v8, v9, Lcom/disney/emagine/sdk/EMTFileTransfer;->contents:[B
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_2

    .line 694
    .end local v5    # "parameters":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v6    # "parameters":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :catchall_1
    move-exception v8

    move-object v5, v6

    .end local v6    # "parameters":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v5    # "parameters":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    goto/16 :goto_1
.end method
