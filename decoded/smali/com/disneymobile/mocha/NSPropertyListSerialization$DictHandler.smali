.class Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;
.super Lcom/disneymobile/mocha/NSPropertyListSerialization$BaseHandler;
.source "NSPropertyListSerialization.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disneymobile/mocha/NSPropertyListSerialization;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DictHandler"
.end annotation


# static fields
.field private static final ELEMENT_DATA:I = 0x6

.field private static final ELEMENT_FALSE:I = 0x4

.field private static final ELEMENT_INTEGER:I = 0x1

.field private static final ELEMENT_KEY:I = 0x0

.field private static final ELEMENT_REAL:I = 0x3

.field private static final ELEMENT_STRING:I = 0x2

.field private static final ELEMENT_TRUE:I = 0x5

.field private static final ELEMENT_UNKNOWN:I = -0x1


# instance fields
.field private currentKey:Ljava/lang/StringBuilder;

.field private currentValue:Ljava/lang/StringBuilder;

.field private dict:Lcom/disneymobile/mocha/NSPropertyListSerialization$Dict;

.field private element:I


# direct methods
.method public constructor <init>(Lcom/disneymobile/mocha/support/ChainedHandler;)V
    .locals 2
    .param p1, "parent"    # Lcom/disneymobile/mocha/support/ChainedHandler;

    .prologue
    const/4 v1, 0x0

    .line 356
    invoke-direct {p0, p1}, Lcom/disneymobile/mocha/NSPropertyListSerialization$BaseHandler;-><init>(Lcom/disneymobile/mocha/support/ChainedHandler;)V

    .line 345
    iput-object v1, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->currentKey:Ljava/lang/StringBuilder;

    .line 346
    iput-object v1, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->currentValue:Ljava/lang/StringBuilder;

    .line 347
    const/4 v0, -0x1

    iput v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->element:I

    .line 357
    new-instance v0, Lcom/disneymobile/mocha/NSPropertyListSerialization$Dict;

    invoke-direct {v0, v1}, Lcom/disneymobile/mocha/NSPropertyListSerialization$Dict;-><init>(Lcom/disneymobile/mocha/NSPropertyListSerialization$1;)V

    iput-object v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->dict:Lcom/disneymobile/mocha/NSPropertyListSerialization$Dict;

    .line 358
    return-void
.end method

.method public constructor <init>(Lorg/xml/sax/XMLReader;)V
    .locals 1
    .param p1, "reader"    # Lorg/xml/sax/XMLReader;

    .prologue
    const/4 v0, 0x0

    .line 352
    invoke-direct {p0, p1}, Lcom/disneymobile/mocha/NSPropertyListSerialization$BaseHandler;-><init>(Lorg/xml/sax/XMLReader;)V

    .line 345
    iput-object v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->currentKey:Ljava/lang/StringBuilder;

    .line 346
    iput-object v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->currentValue:Ljava/lang/StringBuilder;

    .line 347
    const/4 v0, -0x1

    iput v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->element:I

    .line 353
    return-void
.end method


# virtual methods
.method public addChild(Ljava/lang/Object;)V
    .locals 2
    .param p1, "child"    # Ljava/lang/Object;

    .prologue
    .line 451
    iget-object v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->dict:Lcom/disneymobile/mocha/NSPropertyListSerialization$Dict;

    iget-object v0, v0, Lcom/disneymobile/mocha/NSPropertyListSerialization$Dict;->children:Ljava/util/HashMap;

    iget-object v1, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->currentKey:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 452
    return-void
.end method

.method public characters([CII)V
    .locals 1
    .param p1, "ch"    # [C
    .param p2, "start"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 391
    iget v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->element:I

    packed-switch v0, :pswitch_data_0

    .line 406
    :goto_0
    :pswitch_0
    return-void

    .line 393
    :pswitch_1
    iget-object v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->currentKey:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2, p3}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 399
    :pswitch_2
    iget-object v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->currentValue:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2, p3}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 391
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 9
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;

    .prologue
    .line 410
    const-string v6, "key"

    invoke-virtual {v6, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 447
    :cond_0
    :goto_0
    return-void

    .line 412
    :cond_1
    const-string v6, "integer"

    invoke-virtual {v6, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 413
    iget-object v6, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->currentValue:Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 416
    .local v5, "value":Ljava/lang/String;
    :try_start_0
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    .line 421
    .local v4, "intValue":I
    :goto_1
    iget-object v6, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->dict:Lcom/disneymobile/mocha/NSPropertyListSerialization$Dict;

    iget-object v6, v6, Lcom/disneymobile/mocha/NSPropertyListSerialization$Dict;->children:Ljava/util/HashMap;

    iget-object v7, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->currentKey:Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 417
    .end local v4    # "intValue":I
    :catch_0
    move-exception v1

    .line 418
    .local v1, "e":Ljava/lang/NumberFormatException;
    const-string v6, "NSPropertyListSerializable.DictHandler"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "A value in an integer element is not an integer: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 419
    const/4 v4, 0x0

    .restart local v4    # "intValue":I
    goto :goto_1

    .line 422
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    .end local v4    # "intValue":I
    .end local v5    # "value":Ljava/lang/String;
    :cond_2
    const-string v6, "real"

    invoke-virtual {v6, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 423
    iget-object v6, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->currentValue:Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 426
    .restart local v5    # "value":Ljava/lang/String;
    :try_start_1
    invoke-static {v5}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-wide v2

    .line 431
    .local v2, "doubleValue":D
    :goto_2
    iget-object v6, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->dict:Lcom/disneymobile/mocha/NSPropertyListSerialization$Dict;

    iget-object v6, v6, Lcom/disneymobile/mocha/NSPropertyListSerialization$Dict;->children:Ljava/util/HashMap;

    iget-object v7, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->currentKey:Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 427
    .end local v2    # "doubleValue":D
    :catch_1
    move-exception v1

    .line 428
    .restart local v1    # "e":Ljava/lang/NumberFormatException;
    const-string v6, "NSPropertyListSerializable.DictHandler"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "A value in a real element is not a double: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 429
    const-wide/16 v2, 0x0

    .restart local v2    # "doubleValue":D
    goto :goto_2

    .line 432
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    .end local v2    # "doubleValue":D
    .end local v5    # "value":Ljava/lang/String;
    :cond_3
    const-string v6, "string"

    invoke-virtual {v6, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 433
    iget-object v6, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->dict:Lcom/disneymobile/mocha/NSPropertyListSerialization$Dict;

    iget-object v6, v6, Lcom/disneymobile/mocha/NSPropertyListSerialization$Dict;->children:Ljava/util/HashMap;

    iget-object v7, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->currentKey:Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->currentValue:Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 434
    :cond_4
    const-string v6, "false"

    invoke-virtual {v6, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 435
    iget-object v6, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->dict:Lcom/disneymobile/mocha/NSPropertyListSerialization$Dict;

    iget-object v6, v6, Lcom/disneymobile/mocha/NSPropertyListSerialization$Dict;->children:Ljava/util/HashMap;

    iget-object v7, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->currentKey:Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 436
    :cond_5
    const-string v6, "true"

    invoke-virtual {v6, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 437
    iget-object v6, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->dict:Lcom/disneymobile/mocha/NSPropertyListSerialization$Dict;

    iget-object v6, v6, Lcom/disneymobile/mocha/NSPropertyListSerialization$Dict;->children:Ljava/util/HashMap;

    iget-object v7, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->currentKey:Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    sget-object v8, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 438
    :cond_6
    const-string v6, "data"

    invoke-virtual {v6, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 439
    iget-object v6, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->currentValue:Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/disneymobile/mocha/support/Base64Coder;->decode(Ljava/lang/String;)[B

    move-result-object v0

    .line 440
    .local v0, "data":[B
    iget-object v6, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->dict:Lcom/disneymobile/mocha/NSPropertyListSerialization$Dict;

    iget-object v6, v6, Lcom/disneymobile/mocha/NSPropertyListSerialization$Dict;->children:Ljava/util/HashMap;

    iget-object v7, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->currentKey:Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-static {v0}, Lcom/disneymobile/mocha/NSData;->dataWithBytesNoCopy([B)Lcom/disneymobile/mocha/NSData;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 441
    .end local v0    # "data":[B
    :cond_7
    const-string v6, "dict"

    invoke-virtual {v6, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 442
    const-class v6, Lcom/disneymobile/mocha/NSPropertyListSerialization$BaseHandler;

    iget-object v7, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->mParent:Lcom/disneymobile/mocha/support/ChainedHandler;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 443
    iget-object v6, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->mParent:Lcom/disneymobile/mocha/support/ChainedHandler;

    check-cast v6, Lcom/disneymobile/mocha/NSPropertyListSerialization$BaseHandler;

    iget-object v7, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->dict:Lcom/disneymobile/mocha/NSPropertyListSerialization$Dict;

    iget-object v7, v7, Lcom/disneymobile/mocha/NSPropertyListSerialization$Dict;->children:Ljava/util/HashMap;

    invoke-virtual {v6, v7}, Lcom/disneymobile/mocha/NSPropertyListSerialization$BaseHandler;->addChild(Ljava/lang/Object;)V

    .line 445
    :cond_8
    invoke-virtual {p0}, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->stopHandlingEvents()V

    goto/16 :goto_0
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .param p4, "attr"    # Lorg/xml/sax/Attributes;

    .prologue
    .line 362
    invoke-super {p0, p1, p2, p3, p4}, Lcom/disneymobile/mocha/NSPropertyListSerialization$BaseHandler;->startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 365
    const-string v0, "key"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 366
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->currentKey:Ljava/lang/StringBuilder;

    .line 367
    const/4 v0, 0x0

    iput v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->element:I

    .line 387
    :goto_0
    return-void

    .line 368
    :cond_0
    const-string v0, "integer"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 369
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->currentValue:Ljava/lang/StringBuilder;

    .line 370
    const/4 v0, 0x1

    iput v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->element:I

    goto :goto_0

    .line 371
    :cond_1
    const-string v0, "string"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 372
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->currentValue:Ljava/lang/StringBuilder;

    .line 373
    const/4 v0, 0x2

    iput v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->element:I

    goto :goto_0

    .line 374
    :cond_2
    const-string v0, "real"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 375
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->currentValue:Ljava/lang/StringBuilder;

    .line 376
    const/4 v0, 0x3

    iput v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->element:I

    goto :goto_0

    .line 377
    :cond_3
    const-string v0, "false"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 378
    const/4 v0, 0x4

    iput v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->element:I

    goto :goto_0

    .line 379
    :cond_4
    const-string v0, "true"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 380
    const/4 v0, 0x5

    iput v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->element:I

    goto :goto_0

    .line 381
    :cond_5
    const-string v0, "data"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 382
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->currentValue:Ljava/lang/StringBuilder;

    .line 383
    const/4 v0, 0x6

    iput v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->element:I

    goto :goto_0

    .line 385
    :cond_6
    const/4 v0, -0x1

    iput v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->element:I

    goto :goto_0
.end method
