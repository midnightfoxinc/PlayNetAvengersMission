.class public Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;
.super Ljava/lang/Object;
.source "GuestControllerResponse.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/id/android/guestcontroller/GuestControllerResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "GCError"
.end annotation


# instance fields
.field private category:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "category"
    .end annotation
.end field

.field private code:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "code"
    .end annotation
.end field

.field private data:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "data"
    .end annotation
.end field

.field private developerMessage:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "developerMessage"
    .end annotation
.end field

.field private errorId:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "errorId"
    .end annotation
.end field

.field private inputName:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "inputName"
    .end annotation
.end field

.field final synthetic this$0:Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

.field private timestamp:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "timestamp"
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/disney/id/android/guestcontroller/GuestControllerResponse;)V
    .locals 0

    .prologue
    .line 188
    iput-object p1, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;->this$0:Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getCategory()Ljava/lang/String;
    .locals 1

    .prologue
    .line 225
    iget-object v0, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;->category:Ljava/lang/String;

    return-object v0
.end method

.method public getCode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 212
    iget-object v0, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;->code:Ljava/lang/String;

    return-object v0
.end method

.method public getData()Ljava/lang/String;
    .locals 1

    .prologue
    .line 241
    iget-object v0, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;->data:Ljava/lang/String;

    return-object v0
.end method

.method public getDeveloperMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 265
    iget-object v0, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;->developerMessage:Ljava/lang/String;

    return-object v0
.end method

.method public getErrorId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 257
    iget-object v0, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;->errorId:Ljava/lang/String;

    return-object v0
.end method

.method public getInputName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 233
    iget-object v0, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;->inputName:Ljava/lang/String;

    return-object v0
.end method

.method public getTimestamp()Ljava/lang/String;
    .locals 1

    .prologue
    .line 249
    iget-object v0, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;->timestamp:Ljava/lang/String;

    return-object v0
.end method

.method public hasCode()Z
    .locals 1

    .prologue
    .line 217
    iget-object v0, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;->code:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;->code:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setCategory(Ljava/lang/String;)V
    .locals 0
    .param p1, "category"    # Ljava/lang/String;

    .prologue
    .line 229
    iput-object p1, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;->category:Ljava/lang/String;

    .line 230
    return-void
.end method

.method public setCode(Ljava/lang/String;)V
    .locals 0
    .param p1, "code"    # Ljava/lang/String;

    .prologue
    .line 221
    iput-object p1, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;->code:Ljava/lang/String;

    .line 222
    return-void
.end method

.method public setData(Ljava/lang/String;)V
    .locals 0
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 245
    iput-object p1, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;->data:Ljava/lang/String;

    .line 246
    return-void
.end method

.method public setDeveloperMessage(Ljava/lang/String;)V
    .locals 0
    .param p1, "developerMessage"    # Ljava/lang/String;

    .prologue
    .line 269
    iput-object p1, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;->developerMessage:Ljava/lang/String;

    .line 270
    return-void
.end method

.method public setErrorId(Ljava/lang/String;)V
    .locals 0
    .param p1, "errorId"    # Ljava/lang/String;

    .prologue
    .line 261
    iput-object p1, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;->errorId:Ljava/lang/String;

    .line 262
    return-void
.end method

.method public setInputName(Ljava/lang/String;)V
    .locals 0
    .param p1, "inputName"    # Ljava/lang/String;

    .prologue
    .line 237
    iput-object p1, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;->inputName:Ljava/lang/String;

    .line 238
    return-void
.end method

.method public setTimestamp(Ljava/lang/String;)V
    .locals 0
    .param p1, "timestamp"    # Ljava/lang/String;

    .prologue
    .line 253
    iput-object p1, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;->timestamp:Ljava/lang/String;

    .line 254
    return-void
.end method
