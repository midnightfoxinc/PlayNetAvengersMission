.class public Lcom/disney/id/android/DIDRequest;
.super Ljava/lang/Object;
.source "DIDRequest.java"

# interfaces
.implements Landroid/os/Parcelable;
.implements Lcom/disney/id/android/constants/DIDRequestCode;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/disney/id/android/DIDRequest;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private requestCode:I

.field private requestData:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    new-instance v0, Lcom/disney/id/android/DIDRequest$1;

    invoke-direct {v0}, Lcom/disney/id/android/DIDRequest$1;-><init>()V

    sput-object v0, Lcom/disney/id/android/DIDRequest;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "requestCode"    # I

    .prologue
    .line 42
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/disney/id/android/DIDRequest;-><init>(ILjava/lang/String;)V

    .line 43
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 0
    .param p1, "requestCode"    # I
    .param p2, "requestData"    # Ljava/lang/String;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput p1, p0, Lcom/disney/id/android/DIDRequest;->requestCode:I

    .line 38
    iput-object p2, p0, Lcom/disney/id/android/DIDRequest;->requestData:Ljava/lang/String;

    .line 39
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/disney/id/android/DIDRequest;->requestCode:I

    .line 15
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/DIDRequest;->requestData:Ljava/lang/String;

    .line 16
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/disney/id/android/DIDRequest$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/disney/id/android/DIDRequest$1;

    .prologue
    .line 8
    invoke-direct {p0, p1}, Lcom/disney/id/android/DIDRequest;-><init>(Landroid/os/Parcel;)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 47
    const/4 v0, 0x0

    return v0
.end method

.method public getRequestCode()I
    .locals 1

    .prologue
    .line 54
    iget v0, p0, Lcom/disney/id/android/DIDRequest;->requestCode:I

    return v0
.end method

.method public getRequestData()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/disney/id/android/DIDRequest;->requestData:Ljava/lang/String;

    return-object v0
.end method

.method public setRequestCode(I)V
    .locals 0
    .param p1, "requestCode"    # I

    .prologue
    .line 64
    iput p1, p0, Lcom/disney/id/android/DIDRequest;->requestCode:I

    .line 65
    return-void
.end method

.method public setRequestData(Ljava/lang/String;)V
    .locals 0
    .param p1, "requestData"    # Ljava/lang/String;

    .prologue
    .line 68
    iput-object p1, p0, Lcom/disney/id/android/DIDRequest;->requestData:Ljava/lang/String;

    .line 69
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 73
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{requestCode: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/disney/id/android/DIDRequest;->requestCode:I

    invoke-static {v1}, Lcom/disney/id/android/DIDWebUtils;->getRequestCodeStr(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 20
    iget v0, p0, Lcom/disney/id/android/DIDRequest;->requestCode:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 21
    iget-object v0, p0, Lcom/disney/id/android/DIDRequest;->requestData:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 22
    return-void
.end method
