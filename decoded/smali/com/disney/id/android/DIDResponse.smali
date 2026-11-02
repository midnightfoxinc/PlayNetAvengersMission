.class public Lcom/disney/id/android/DIDResponse;
.super Ljava/lang/Object;
.source "DIDResponse.java"

# interfaces
.implements Lcom/disney/id/android/constants/DIDResponseCode;


# instance fields
.field private final error:Lcom/disney/id/android/DIDException;

.field private final request:Lcom/disney/id/android/DIDRequest;

.field private final responseCode:I

.field private final responseData:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILcom/disney/id/android/DIDRequest;)V
    .locals 1
    .param p1, "responseCode"    # I
    .param p2, "request"    # Lcom/disney/id/android/DIDRequest;

    .prologue
    const/4 v0, 0x0

    .line 31
    invoke-direct {p0, p1, v0, p2, v0}, Lcom/disney/id/android/DIDResponse;-><init>(ILjava/lang/String;Lcom/disney/id/android/DIDRequest;Lcom/disney/id/android/DIDException;)V

    .line 32
    return-void
.end method

.method public constructor <init>(ILcom/disney/id/android/DIDRequest;Lcom/disney/id/android/DIDException;)V
    .locals 1
    .param p1, "responseCode"    # I
    .param p2, "request"    # Lcom/disney/id/android/DIDRequest;
    .param p3, "error"    # Lcom/disney/id/android/DIDException;

    .prologue
    .line 27
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/disney/id/android/DIDResponse;-><init>(ILjava/lang/String;Lcom/disney/id/android/DIDRequest;Lcom/disney/id/android/DIDException;)V

    .line 28
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Lcom/disney/id/android/DIDRequest;)V
    .locals 1
    .param p1, "responseCode"    # I
    .param p2, "responseData"    # Ljava/lang/String;
    .param p3, "request"    # Lcom/disney/id/android/DIDRequest;

    .prologue
    .line 23
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/disney/id/android/DIDResponse;-><init>(ILjava/lang/String;Lcom/disney/id/android/DIDRequest;Lcom/disney/id/android/DIDException;)V

    .line 24
    return-void
.end method

.method constructor <init>(ILjava/lang/String;Lcom/disney/id/android/DIDRequest;Lcom/disney/id/android/DIDException;)V
    .locals 0
    .param p1, "responseCode"    # I
    .param p2, "responseData"    # Ljava/lang/String;
    .param p3, "request"    # Lcom/disney/id/android/DIDRequest;
    .param p4, "error"    # Lcom/disney/id/android/DIDException;

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput p1, p0, Lcom/disney/id/android/DIDResponse;->responseCode:I

    .line 17
    iput-object p2, p0, Lcom/disney/id/android/DIDResponse;->responseData:Ljava/lang/String;

    .line 18
    iput-object p3, p0, Lcom/disney/id/android/DIDResponse;->request:Lcom/disney/id/android/DIDRequest;

    .line 19
    iput-object p4, p0, Lcom/disney/id/android/DIDResponse;->error:Lcom/disney/id/android/DIDException;

    .line 20
    return-void
.end method


# virtual methods
.method public final getError()Lcom/disney/id/android/DIDException;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/disney/id/android/DIDResponse;->error:Lcom/disney/id/android/DIDException;

    return-object v0
.end method

.method public getRequest()Lcom/disney/id/android/DIDRequest;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/disney/id/android/DIDResponse;->request:Lcom/disney/id/android/DIDRequest;

    return-object v0
.end method

.method public final getResponseCode()I
    .locals 1

    .prologue
    .line 40
    iget v0, p0, Lcom/disney/id/android/DIDResponse;->responseCode:I

    return v0
.end method

.method public final getResponseData()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/disney/id/android/DIDResponse;->responseData:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 75
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "{Response:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 76
    .local v0, "sb":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/disney/id/android/DIDResponse;->request:Lcom/disney/id/android/DIDRequest;

    if-eqz v1, :cond_0

    .line 77
    const-string v1, " requestCode: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/disney/id/android/DIDResponse;->request:Lcom/disney/id/android/DIDRequest;

    invoke-virtual {v2}, Lcom/disney/id/android/DIDRequest;->getRequestCode()I

    move-result v2

    invoke-static {v2}, Lcom/disney/id/android/DIDWebUtils;->getRequestCodeStr(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    :cond_0
    const-string v1, " responseCode: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/disney/id/android/DIDResponse;->responseCode:I

    invoke-static {v2}, Lcom/disney/id/android/DIDWebUtils;->getResultCodeStr(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    iget-object v1, p0, Lcom/disney/id/android/DIDResponse;->error:Lcom/disney/id/android/DIDException;

    if-eqz v1, :cond_1

    .line 83
    const-string v1, ", error: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/disney/id/android/DIDResponse;->error:Lcom/disney/id/android/DIDException;

    invoke-virtual {v2}, Lcom/disney/id/android/DIDException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    const-string v1, ", message: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/disney/id/android/DIDResponse;->error:Lcom/disney/id/android/DIDException;

    invoke-virtual {v2}, Lcom/disney/id/android/DIDException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    :cond_1
    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
