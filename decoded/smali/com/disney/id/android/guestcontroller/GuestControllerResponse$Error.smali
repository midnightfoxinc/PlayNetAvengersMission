.class public Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;
.super Ljava/lang/Object;
.source "GuestControllerResponse.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/id/android/guestcontroller/GuestControllerResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Error"
.end annotation


# instance fields
.field private conversationId:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "conversationId"
    .end annotation
.end field

.field private correlationId:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "correlationId"
    .end annotation
.end field

.field private errors:Ljava/util/ArrayList;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "errors"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;",
            ">;"
        }
    .end annotation
.end field

.field private keyCategory:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "keyCategory"
    .end annotation
.end field

.field final synthetic this$0:Lcom/disney/id/android/guestcontroller/GuestControllerResponse;


# direct methods
.method public constructor <init>(Lcom/disney/id/android/guestcontroller/GuestControllerResponse;)V
    .locals 0

    .prologue
    .line 133
    iput-object p1, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->this$0:Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getConversationId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 156
    iget-object v0, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->conversationId:Ljava/lang/String;

    return-object v0
.end method

.method public getCorrelationId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 164
    iget-object v0, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->correlationId:Ljava/lang/String;

    return-object v0
.end method

.method public getErrors()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;",
            ">;"
        }
    .end annotation

    .prologue
    .line 172
    iget-object v0, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->errors:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getKeyCategory()Ljava/lang/String;
    .locals 1

    .prologue
    .line 148
    iget-object v0, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->keyCategory:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hasErrors()Z
    .locals 1

    .prologue
    .line 176
    iget-object v0, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->errors:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->errors:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasKeyCategory()Z
    .locals 1

    .prologue
    .line 180
    iget-object v0, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->keyCategory:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->keyCategory:Ljava/lang/String;

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

.method public setConversationId(Ljava/lang/String;)V
    .locals 0
    .param p1, "conversationId"    # Ljava/lang/String;

    .prologue
    .line 160
    iput-object p1, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->conversationId:Ljava/lang/String;

    .line 161
    return-void
.end method

.method public setCorrelationId(Ljava/lang/String;)V
    .locals 0
    .param p1, "correlationId"    # Ljava/lang/String;

    .prologue
    .line 168
    iput-object p1, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->correlationId:Ljava/lang/String;

    .line 169
    return-void
.end method

.method public setErrors(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 184
    .local p1, "errors":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/disney/id/android/guestcontroller/GuestControllerResponse$GCError;>;"
    iput-object p1, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->errors:Ljava/util/ArrayList;

    .line 185
    return-void
.end method

.method public setKeyCategory(Ljava/lang/String;)V
    .locals 0
    .param p1, "keyCategory"    # Ljava/lang/String;

    .prologue
    .line 152
    iput-object p1, p0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse$Error;->keyCategory:Ljava/lang/String;

    .line 153
    return-void
.end method
