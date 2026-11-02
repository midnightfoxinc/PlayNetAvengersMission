.class public Lcom/disney/emagine/sdk/EMTConstants;
.super Ljava/lang/Object;
.source "EMTConstants.java"


# static fields
.field public static final ADVERTISEMENT_UINT32_DEVICE_ID:I = 0x9

.field public static final EMAGINE_MFG_DATA_KEY:Ljava/lang/String; = ""

.field public static final EMAGINE_MFG_ID:[B

.field public static final EMAGINE_NOTIFY_UUID_STRING:Ljava/lang/String; = "0643e701-b573-46e0-a878-06c78140b0db"

.field public static final EMAGINE_SERVICE_UUID:Ljava/util/UUID;

.field public static final EMAGINE_SERVICE_UUID_STRING:Ljava/lang/String; = "0643e700-b573-46e0-a878-06c78140b0db"

.field public static final EMAGINE_WRITE_UUID_STRING:Ljava/lang/String; = "0643e702-b573-46e0-a878-06c78140b0db"

.field public static final KEY_DEVICE_ID:Ljava/lang/String; = "device_id"

.field public static final KEY_PACKAGE_ID:Ljava/lang/String; = "packageId"

.field public static final KEY_VERSION:Ljava/lang/String; = "version"

.field public static final MAX_PACKET_SIZE:I = 0x14

.field public static final NOTIFICATION_DESCRIPTOR_STRING:Ljava/lang/String; = "00002902-0000-1000-8000-00805f9b34fb"

.field public static final NOTIFICATION_DESCRIPTOR_UUID:Ljava/util/UUID;

.field public static final NOTIFY_CHARACTERISTIC_UUID:Ljava/util/UUID;

.field public static final PACKAGES_PRESENT_FILE:Ljava/lang/String; = "packagesPresent.drt"

.field public static final PLAYER_DATA_JSON:Ljava/lang/String; = "playerDatJson"

.field public static final SCAN_PERIOD:J = 0xea60L

.field public static final WRITE_CHARACTERISTIC_UUID:Ljava/util/UUID;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 11
    const-string v0, "00002902-0000-1000-8000-00805f9b34fb"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    sput-object v0, Lcom/disney/emagine/sdk/EMTConstants;->NOTIFICATION_DESCRIPTOR_UUID:Ljava/util/UUID;

    .line 12
    const-string v0, "0643e700-b573-46e0-a878-06c78140b0db"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    sput-object v0, Lcom/disney/emagine/sdk/EMTConstants;->EMAGINE_SERVICE_UUID:Ljava/util/UUID;

    .line 13
    const-string v0, "0643e701-b573-46e0-a878-06c78140b0db"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    sput-object v0, Lcom/disney/emagine/sdk/EMTConstants;->NOTIFY_CHARACTERISTIC_UUID:Ljava/util/UUID;

    .line 14
    const-string v0, "0643e702-b573-46e0-a878-06c78140b0db"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    sput-object v0, Lcom/disney/emagine/sdk/EMTConstants;->WRITE_CHARACTERISTIC_UUID:Ljava/util/UUID;

    .line 18
    const/4 v0, 0x2

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/disney/emagine/sdk/EMTConstants;->EMAGINE_MFG_ID:[B

    return-void

    nop

    :array_0
    .array-data 1
        0xdt
        -0x10t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
